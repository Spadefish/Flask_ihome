# coding: utf8

# 图片验证码的redis有效期 单位： 秒
IMAGE_CODE_REDIS_EXPIRES = 300

# 短信验证码有效期  单位： 秒
SMS_CODE_REDIS_EXPIRES = 300

# 短信验证码发送间隔  单位： 秒
SEND_SMS_CODE_INTERVAL = 60

# 登录错误尝试次数
LOGIN_ERROR_MAX_TIMES = 5

# 登录错误限制时间 单位：秒
LOGIN_ERROR_FORBID_TIME = 600

# 七牛的域名
QINIU_URL_DOMAIN = 'http://091tkjrre.bkt.cloud.com/'

# 地区的缓存时间  单位：秒
AREA_INFO_REDIS_CACHE_EXPIRES = 7200
