from django.contrib import admin
from .models import UserInfo
from django.contrib.auth.admin import UserAdmin

# Register your models here.
admin.site.register(UserInfo,UserAdmin)