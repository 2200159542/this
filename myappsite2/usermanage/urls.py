from django.urls import path
from . import views

urlpatterns = [

    path('index',views.index),
    path('log',views.usermanage),
    path('not_login',views.not_login),
    path('user_image',views.upload_user_image)
]