#### 开发环境介绍

##### python2.7 + mysql + redis + flask=0.10.1 
**项目启动 python manage.py runserver**
###### 项目依赖的安装包

```
{
    Package           Version
    -irtualenv        16.6.1
    alembic           1.0.11
    amqp              2.5.0
    billiard          3.6.0.0
    celery            4.3.0 (异步任务处理库)
    Flask             0.10.1
    Flask-Migrate     2.5.2
    Flask-MySQLdb     0.2.0
    Flask-Script      2.0.6
    Flask-Session     0.3.1
    Flask-SQLAlchemy  2.4.0
    Flask-WTF         0.14.2
    itsdangerous      1.1.0
    Jinja2            2.10.1
    Mako              1.0.13
    MarkupSafe        1.1.1
    mysqlclient       1.4.2.post1
    pbr               5.4.0
    Pillow            6.1.0 (图片处理需要这个包)
    pip               19.1.1
    python-dateutil   2.8.0
    python-editor     1.0.4
    pytz              2019.1
    redis             3.2.1
    setuptools        41.0.1
    six               1.12.0
    SQLAlchemy        1.3.5
    stevedore         1.30.1
    virtualenv        16.6.1
    virtualenv-clone  0.5.3
    virtualenvwrapper 4.8.4
    Werkzeug          0.15.4
    wheel             0.33.4
    WTForms           2.2.1
    qiniu             7.2.6 (七牛云服务)
    python-alipay-sdk 1.10.1 (阿里云生成签名的工具)
}

```

**建立模型类以后的数据库迁移**

**a,初次迁移 python manage.py db init**

**b,执行数据库迁移文件 python manage.py db migrate -m "init tables"**

**c,运行数据库升级命令 python manage.py db upgrade**

**每当对数据模型类里面的字段进行修改之后 都要再重新更新和迁移下数据库的字段 (执行一遍b, c命令)**

**引入celery进行短信异步任务处理并进行启动 cd Flask_ihome => celery -A ihome.tasks.main worker -l info**
