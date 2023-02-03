from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.
class UserInfo(AbstractUser):
    
    image = models.FileField('用户头像',upload_to='user_image',null=True,blank=False)
    phone = models.CharField('电话',max_length=25,default='')
    wechat = models.CharField('微信',max_length=30,default='')


    def __str__(self) -> str:
        return '用户名%s'%(self.username)
        