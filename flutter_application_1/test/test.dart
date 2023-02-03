import 'package:flutter_application_1/common/Net.dart';



void main(List<String> args) async{


  List<dynamic> dataList = await display_goods();
  print(dataList.length);
  //List<AssetEntity>? result = await AssetPicker.pickAssets();

  // String s = '[{"model": "goodsdata.goods", "pk": 1, "fields": {"goods": "鞋子", "summary": ".....", "user": 1}},{"model": "usermanage.userinfo", "pk": 1, "fields": {"password": "1234", "last_login": null, "is_superuser": false, "username": "xs", "first_name": "", "last_name": "", "email": "", "is_staff": false, "is_active": true, "date_joined": "2023-01-15T08:08:37.575Z", "image": "", "phone": "", "wechat": "", "groups": [], "user_permissions": []}}]';
  // var ss = jsonDecode(s);
  // print(ss[1]['pk']);

  // var user = User_Manage();

  // if(await user.upload_user_image('/Users/xusheng/Desktop/my_app/flutter_application_1/images/1.jpg')){
  //   print('头像上传成功\n');
  // }
  
  // if(await user.login('123', '1234')){
  //   print(' 123 登陆成功\n');
  // }

  // if(await user.change_passwprd('123', '1234')){
  //   print(' 123 修改密码成功\n');
  // }

  // if(await user.logout()){
  //   print(' 123 退出成功\n');
  //   if(!await user.is_log()) print('访问 index 失败');
  // }

}