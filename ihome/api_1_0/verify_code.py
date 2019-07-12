# coding: utf-8

from flask import current_app, jsonify, make_response

from . import api
from ihome.utils.captcha.captcha import captcha
from ihome import redis_store, constants
from ihome.utils.response_code import RET


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
        redis_store.setex('image_code%s' % image_code_id, constants.IMAGE_CODE_REDIS_EXPIRES, text)
    except Exception as e:
        # 记录日志
        current_app.logger.error(e)
        return jsonify(error=RET.DBERR, errmsg='save image_code_id failed')

    # 返回图片
    resp = make_response(image_data)
    resp.headers['Content-Type'] = 'image/jpg'
    return resp
