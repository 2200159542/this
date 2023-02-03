from django.views.decorators.csrf import csrf_exempt
from goodsdata.models import *
from django.http import JsonResponse,HttpResponse

# Create your views here.
@csrf_exempt
def goods_upload(request):

    try:
        goods = request.user.goods_set.create(
            goods=request.POST['name'],
            summary=request.POST['summary'],
            user = request.user
        )

        pictures = request.FILES.getlist('files')

        for picture in pictures:
            Picture.objects.create(picture=picture,goods=goods)
    except:
        return HttpResponse('ERROR')

    return HttpResponse('OK')


def goods_display(request):

    res = []

    try:

        goodses = Goods.objects.all()

        for goods in goodses:
            re = {} 
            re['name'] = goods.goods
            re['summary'] = goods.summary
            re['username'] = goods.user.username
            
            try:    
                re['userimage'] = goods.user.image.url
            except:
                re['userimage'] = '/media/user_image/1.jpg'

            
            pictures = goods.picture_set.all()

            pi = []
            for picture in pictures:
                pi.append(picture.picture.url)

            re['picture'] = pi
            res.append(re)
    except:
        return HttpResponse('ERROR')
    
    return JsonResponse(res,safe=False)