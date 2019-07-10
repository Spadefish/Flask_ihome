# coding:utf-8

from ihome import create_app

# 创建flask应用对象
app = create_app('develop')

if __name__ == '__main__':
    app.run()
