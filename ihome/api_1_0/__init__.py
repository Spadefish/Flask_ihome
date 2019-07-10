# coding:utf-8

from flask import Blueprint
# 导入蓝图的视图函数
from . import demo

# 创建蓝图对象
api = Blueprint('api_1_0', __name__)
