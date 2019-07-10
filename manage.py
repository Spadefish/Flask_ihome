# coding:utf-8

from ihome import create_app

# 创建flask应用对象
app = create_app('develop')


@app.route('/v1.0/index')
def index():
    return 'index page'


@app.route('/v2.0/index')
def index():
    return 'index page'


if __name__ == '__main__':
    app.run()
