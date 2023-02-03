#from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from django.contrib.auth import login as Login
from django.contrib.auth import logout as Logout
from .models import UserInfo


# Create your views here.

@csrf_exempt
def usermanage(request):
    """

        当前视图的路由为 user/log, 处理与用户相关的事务
        ----------------------------------|----------|
        |     动作\参数    |               |          |
        |-----------------|---------------|----------|
        |       login     | username      | password |
        |-----------------|---------------|----------|
        |       reg       | username      | password |
        |-----------------|---------------|----------|
        |       logout    |      \        |     \    |
        |-----------------|---------------|----------|
        | change_password | new_password  |     \    |
        |-----------------|---------------|----------|

    """

    login = request.POST.get('login',0)
    reg = request.POST.get('reg',0)
    logout = request.POST.get('logout',0)
    change_password = request.POST.get('change_password',0)

    username = request.POST['username']
    password = request.POST['password']

    if login:

        from django.contrib.auth import authenticate
        user = authenticate(username=username, password=password)

        if user:
            Login(request,user)
            return HttpResponse('OK')
        else:
            return HttpResponse('ERROR')

    if reg:

        try:
            user = UserInfo.objects.create_user(username,password=password)
        except:
            return HttpResponse('ERROR')

        Login(request,user)
        return HttpResponse('OK')

    if logout:
        try:
            Logout(request)
            return HttpResponse('OK')
        except:
            return HttpResponse('ERROR')

    if change_password:
        try:
            from django.contrib.auth import authenticate
            user = authenticate(username=request.user.username, password=request.POST['old_password'])
            if user is None:
                return HttpResponse('ERROR')
            
            user.set_password(request.POST['new_password'])
            user.save()
            return HttpResponse('OK')

        except:
            return HttpResponse('ERROR')



from django.contrib.auth.decorators import login_required

"""
    index 为客户端第一次请求的视图, 路由为 user/index, 如果发出请求的客户端
    还存在与服务器的会话, 那么响应'OK', 否则跳转到 not_login 视图, 并响应'ERROR'
"""

@login_required
def index(request): 
    return HttpResponse('OK')


def not_login(request):
    return HttpResponse('ERROR')



@csrf_exempt
def upload_user_image(request):

    """
    上传用户头像的响应视图,路由为 /user/user_image, 接受一个参数: user_image;
    上传成功返回 UPLOAD OK, 否则返回 UPLOAD ERROR
    """

    try:
        request.user.image = request.FILES['user_image']
        request.user.save()
    except:
        return HttpResponse('UPLOAD ERROR')

    return HttpResponse('UPLOAD OK')
    