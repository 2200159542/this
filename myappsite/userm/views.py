from django.shortcuts import render
from django.http import HttpResponse,HttpResponseRedirect
from .models import *
import hashlib

# Create your views here.
def reg(request):

    # 注册

    # GET 返回页面
    if request.method == 'GET':
        return render(request,'user/register.html')

    # POST 处理提交数据
    elif request.method == 'POST':
        username = request.POST['username']
        password_1 = request.POST['passwd_1']
        password_2 = request.POST['passwd_2']
    # 1 两个秘密要一致
        if password_1 != password_2:
            return HttpResponse('两次密码不一致')
    # 2 当前用户是否可用
        old_users = userma.objects.filter(user=username)
        if old_users:
            return HttpResponse('用户名已注册')
    # 3 插入数据
        userma.objects.create(user=username,passwd=password_1)
        return HttpResponse('注册成功')


def reg2(request):

    username = request.GET.get('username',0)
    passwd_1 = request.GET.get('passwd_1',0)
    passwd_2 = request.GET.get('passwd_2',0)

    if username and passwd_1 and passwd_2 :
        if passwd_1 != passwd_2:
            return HttpResponse('两次密码不一致')

        old_users = userma.objects.filter(user=username)
        if old_users:
            return HttpResponse('用户名已注册')


        # 哈希算法 md5，sha-256
        # 特点 
        # 1 定长输出： md5 - 32位16进制
        # 2 不可逆
        # 3 雪崩效应 ：输入改变，输入必变
        # 使用场景：1-密码处理 2-文件完整性校验

        m = hashlib.md5()
        m.update(passwd_1.encode())
        passwd_m = m.hexdigest()


        try:
            user = userma.objects.create(user=username,passwd=passwd_m)
        except Exception as e:
            print('--create user error %s'%(e))
            return HttpResponse('用户名已注册')

        # 设置会话
        request.session['username'] = username
        request.session['uid'] = user.id

        return HttpResponse('注册成功')

    else:
        return render(request,'user/register.html')



def login(request):
    username = request.GET.get('username',0)
    passwd_1 = request.GET.get('passwd_1',0)

    if username and passwd_1:
        i = userma.objects.filter(user = username)
        if not i:
            return HttpResponse('用户名不存在')
        
        m = hashlib.md5()
        m.update(passwd_1.encode())
        passwd_m = m.hexdigest()

        if userma.objects.get(user=username).passwd!=passwd_m:
            return HttpResponse('密码错误')

        request.session['username'] = username
        #request.session['uid'] = user.id
        #return HttpResponse('登陆成功')
        return HttpResponseRedirect('../../index/')
    else:
        return render(request,'user/login.html')