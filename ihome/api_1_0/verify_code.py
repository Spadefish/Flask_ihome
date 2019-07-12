# coding: utf-8

from flask import current_app, jsonify, make_response, request

from . import api
from ihome.utils.captcha.captcha import captcha
from ihome import redis_store, constants
from ihome.utils.response_code import RET
from ihome.models import User
from ihome.libs.yuntongxun.sms import CCP
import random


# GET 127.0.0.1/api/v1.0/image_codes/<image_code_id>
@api.route('/image_codes/<image_code_id>')
def get_image_code(image_code_id):
    """
    获取图片验证码
    : params image_code_id 图片验证码编号
    :return: 验证码图片
    """
    # 生成验证码图片
    # 名字 真实文本 图片二进制数据
    name, text, image_data = captcha.generate_captcha()

    # 将验证码真实值保存在redis中，设置有效期
    # redis 字符串 列表 哈希 set

    # 单条记录，选用字符串
    # 'image_code_编号1': '真实值'
    # 'image_code_编号2': '真实值'
    # redis_store.set('image_code_%s' % image_code_id, text)
    # redis_store.expire('image_code_%s' % image_code_id, constants.IMAGE_CODE_REDIS_EXPIRES)
    try:
        redis_store.setex('image_code_%s' % image_code_id, constants.IMAGE_CODE_REDIS_EXPIRES, text)
    except Exception as e:
        # 记录日志
        current_app.logger.error(e)
        return jsonify(error=RET.DBERR, errmsg='save image_code_id failed')

    # 返回图片
    resp = make_response(image_data)
    resp.headers['Content-Type'] = 'image/jpg'
    return resp


# GET /api/v1.0/sms_codes/<mobile>?image_code=xxxx&image_code_id=xxxx
@api.route("/sms_codes/<re(r'1[34578]\d{9}'):mobile>")
def get_sms_code(mobile):
    """
    获取短信验证码
    :param mobile:
    :return:
    """
    # 获取参数
    image_code = request.args.get('image_code')
    image_code_id = request.args.get('image_code_id')

    # 校验参数
    if not all([image_code, image_code_id]):
        # 表示参数不完整
        return jsonify(errno=RET.PARAMERR, errmsg='参数不完整')

    # 业务逻辑处理
    # 从Redis中取出真实的图片验证码
    try:
        real_image_code = redis_store.get('image_code_%s' % image_code_id)
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.DBERR, errmsg='redis数据库异常')

    # 判断图片验证码是否过期
    if real_image_code is None:
        # 表示图片验证码没有生成或过期
        return jsonify(errno=RET.NODATA, errmsg='图片验证码失效')

    # 与用户填写的值进行对比
    if real_image_code.lower() != image_code.lower():
        # 表示用户验证码填写错误
        return jsonify(errno=RET.NODATA, errmsg='图片验证码错误')

    # 判断手机号是否在数据库里面存在
    try:
        user = User.query.filter_by(mobile=mobile).first()
    except Exception as e:
        current_app.logger.error(e)
    else:
        if user is not None:
            # 表示手机号已经存在
            return jsonify(error=RET.DATAEXIST, errmsg='手机号已存在')

    # 如果手机号在数据库里面不存在 则生成验证码
    sms_code = '%06d' % random.randint(0, 999999)

    # 保存真实的短信验证码
    try:
        redis_store.setex('sms_code_%s' % mobile, constants.SMS_CODE_REDIS_EXPIRES, sms_code)
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.DBERR, errmsg='保存短信验证码异常')

    # 发送短信
    try:
        ccp = CCP()
        result = ccp.send_template_sms(mobile, [sms_code, int(constants.SMS_CODE_REDIS_EXPIRES / 60)], 1)
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.THIRDERR, errmsg="发送异常")

    # 返回值
    if result == 0:
        # 发送成功
        return jsonify(errno=RET.OK, errmsg='验证码发送成功')
    else:
        return jsonify(error=RET.THIRDERR, errmsg="发送失败")

