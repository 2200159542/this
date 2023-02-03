from django.urls import path
from . import views

urlpatterns = [

    path('goods_upload',views.goods_upload),
    path('goods_download',views.goods_display)
]