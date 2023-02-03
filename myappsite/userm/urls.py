from django.urls import path
from . import views

urlpatterns = [

    path('reg/', views.reg2),
    path('log/', views.login)
]