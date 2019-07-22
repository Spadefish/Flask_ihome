# coding:utf-8

from flask import Blueprint

# 创建蓝图对象
api = Blueprint('api_1_0', __name__)

# 导入蓝图的视图 一定要写在这儿！！！ 因为要先有蓝图对象才可以去执行里面的路由函数
from . import demo, verify_code, passport, profile, houses, orders, pay
