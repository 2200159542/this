// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:io';
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';


class User_Manage{

  late Dio _dio;
  final String _url = '/user/log';
  final String _url_index = '/user/index';
  final String _url_image = '/user/user_image';
  final String _url_goods_up = '/goods/goods_upload';
  final String _url_goods_down = '/goods/goods_download';
  final String _cookies_path = '/Users/xusheng/Desktop/my_app/flutter_application_1/.cookies/';


 static final User_Manage _instance = User_Manage._();


  factory User_Manage() => _a();

  static User_Manage _a(){
    return _instance;
  }

  User_Manage._(){
    _dio = Dio();
    _dio.options.baseUrl ='http://127.0.0.1:8000';
    _dio.options.connectTimeout = 3000;
    _dio.options.receiveTimeout = 3000;
    _dio.interceptors.add(
      CookieManager(
        PersistCookieJar(
          ignoreExpires: true,
          storage: FileStorage(
            Directory(_cookies_path).path
          )
        )
      )
    );
  }




  login(String username,String password) async {
    var data = FormData.fromMap({'username':username,'password':password,'login':'ok'});

    try {
      Response response = await _dio.post(_url,data: data);

    if(response.data == 'OK') {
      return true;
    } else {
      return false;
    }
    } catch (e) {
      return false;
    }
  }

  reg(String username,String password) async {
    var data = FormData.fromMap({'username':username,'password':password,'reg':'ok'});

    try {
      Response response = await _dio.post(_url,data: data);

    if(response.data == 'OK') {
      return true;
    } else {
      return false;
    }
    } catch (e) {
      return false;
    }
  }

  logout() async {
    var data = FormData.fromMap({'username':'','password':'','logout':'ok'});

    try {
      Response response = await _dio.post(_url,data: data);

    if(response.data == 'OK') {
      return true;
    } else {
      return false;
    }
    } catch (e) {
      return false;
    }
  }

  change_passwprd(String old_password,String new_password) async {
    var data = FormData.fromMap({'change_password':'ok','old_password':old_password,'new_password':new_password,'username':'','password':'',});

    try {
      Response response = await _dio.post(_url,data: data);

    if(response.data == 'OK') {
      return true;
    } else {
      return false;
    }
    } catch (e) {
      return false;
    }
  }

  is_log() async {
    
    try {
      Response response = await _dio.get(_url_index);

    if(response.data == 'OK') {
      return true;
    } else {
      return false;
    }
    } catch (e) {
      return false;
    }
  
  }

  upload_user_image(String user_image_path) async {

  try {
    Response response = await _dio.post(
      _url_image,
      data: FormData.fromMap({
        'user_image':MultipartFile.fromFileSync(user_image_path)
      })
    );

    if(response.data == 'UPLOAD OK') {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
    

  }

  upload_goods(String name,String summary,images)async{

    List list = [];

    for(String image in images){
      list.add(MultipartFile.fromFileSync(image));
    }

    try {
      Response response = await _dio.post(
        _url_goods_up,
        data: FormData.fromMap({
        'name':name,
        'summary':summary,
        'files':list
        })
      );

      if(response.data == 'OK') {
      return true;
      } else {
        return false;
      }   
    } catch (e) {
      return false;
    }
  }

  // display_goods()async{
  //   var response = await _dio.get(_url_goods_down);
  //   return jsonDecode(response.data);
  // }

}

display_goods()async{
    var response = await Dio().get('http://127.0.0.1:8000/goods/goods_download',options: Options(responseType: ResponseType.plain));
    return jsonDecode(response.data);
}