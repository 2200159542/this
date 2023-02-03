from django.db import models
from usermanage.models import UserInfo

# Create your models here.

class Goods(models.Model):
    goods = models.CharField(max_length=32,default='')
    summary = models.CharField(max_length=100,default='')
    user = models.ForeignKey(UserInfo,on_delete=models.CASCADE)

class Picture(models.Model):
    goods = models.ForeignKey(Goods,on_delete=models.CASCADE)
    picture = models.FileField('商品照片',upload_to='goods')
