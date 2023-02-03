from django.http import HttpResponse
from django.shortcuts import render


def index(request):
    if request.method == 'GET':
        return HttpResponse('hgkgujl')
        #return render(request,'/index/index.html')