# coding: utf-8

import datetime

from flask import request, g, jsonify, current_app
from ihome import db, redis_store
from ihome.utils.commons import login_required
from ihome.utils.response_code import RET
from ihome.models import House, Order

from . import api


@api.route('/orders', methods=['POST'])
@login_required
def save_order():
    """保存订单 当前的用户角色是客人"""
    user_id = g.user_id

    # 获取post请求参数
    order_data = request.get_json()
    if not order_data:
        return jsonify(errno=RET.PARAMERR, errmsg="参数错误")

    house_id = order_data.get('house_id')  # 预定房屋的编号
    start_date_str = order_data.get("start_date")  # 预订的起始时间
    end_date_str = order_data.get("end_date")  # 预订的结束时间

    # 参数检查
    if not all([house_id, start_date_str, end_date_str]):
        return jsonify(errno=RET.PARAMERR, errmsg="参数错误")

    try:
        # 将请求的时间参数字符串转换为datetime类型  (跟数据库里面的时间类型保持一致)
        start_date = datetime.datetime.strptime(start_date_str, "%Y-%m-%d")
        end_date = datetime.datetime.strptime(end_date_str, "%Y-%m-%d")
        assert start_date <= end_date
        # 计算预订的天数
        days = (end_date - start_date).days + 1  # datetime.timedelta
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.PARAMERR, errmsg="日期格式错误")

    # 检查房屋是够存在
    try:
        house = House.query.get(house_id)
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.DBERR, errmsg="获取房屋信息失败")
    if not House:
        return jsonify(errno=RET.NODATA, errmsg="房屋不存在")

    # 检查预定的房屋是否是房东自己的
    if user_id == house.user_id:
        return jsonify(errno=RET.ROLEERR, errmsg="您不能预订自己的房屋")

    #  确保用户预定的时间内 房屋没有被别人下单 通过订单时间来判断
    try:
        # 查询时间冲突的订单 （所以要根据订单来查）
        count = Order.query.filter(Order.house_id == house_id, Order.begin_date <= end_date,
                                   Order.end_date >= start_date).count()
        # select count(*) from order where ...
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.DBERR, errmsg="检查出错，请稍候重试")
    if count > 0:
        return jsonify(errno=RET.DATAERR, errmsg="房屋已被预订")

    # 订单总额
    amount = days * house.price

    # 保存订单数据
    order = Order(
        house_id=house_id,
        user_id=user_id,
        begin_date=start_date,
        end_date=end_date,
        days=days,
        house_price=house.price,
        amount=amount
    )

    # 将数据提交到数据库
    try:
        db.session.add(order)
        db.session.commit()
    except Exception as e:
        current_app.logger.error(e)
        db.session.rollback()
        return jsonify(errno=RET.DBERR, errmsg="保存订单失败")
    return jsonify(errno=RET.OK, errmsg="OK", data={"order_id": order.id})
