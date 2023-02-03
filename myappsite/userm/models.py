from django.db import models

# Create your models here.
class userma(models.Model):
    user = models.CharField('用户名',max_length=20,unique=True)
    passwd = models.CharField('密码',max_length=32)
    created_time = models.DateTimeField('创建时间',auto_now_add=True) # auto_now_add : 表示创建时自动添加
    updata_time = models.DateTimeField('更新时间',auto_now=True) # auto_now : 表示更新时自动生成

    def __str__(self) -> str:
        return 'username %s'%(self.user)
    #state = models.