import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/Net.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
//import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class SellPage extends StatefulWidget {
  const SellPage({super.key});

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  TextEditingController _GoodsController = TextEditingController();
  TextEditingController _SummaryController = TextEditingController();

  String _goods = '';
  String _summary = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: _GoodsController,
                  onChanged: (value) {
                    setState(() {
                      _goods = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    prefixIcon: Icon(Icons.shop_two),
                    label: Text('商品名称'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _SummaryController,
                  onChanged: (value) {
                    setState(() {
                      _summary = value;
                    });
                  },
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    prefixIcon: Icon(Icons.summarize_outlined),
                    label: Text('商品描述内容简介'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(children: [
                  const SizedBox(width: 25,),
                  Container(
                    height: MediaQuery.of(context).size.width / 5,
                    width: MediaQuery.of(context).size.width / 5,
                    //color: Colors.grey,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: IconButton(
                      color: Colors.black,
                      icon: const Icon(Icons.add_a_photo),
                      onPressed: (() => _onTapPickFromGallery()),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _Children(),
                  )
                ]),
                const SizedBox(height: 30,),
                InkWell(
                  onTap: () async{
                    if(_goods == ''){
                      _errorDialog('商品名称不能为空！');
                      return;
                    }
                    if(_summary == ''){
                      _errorDialog('请对商品做必要描述！');
                      return;
                    }
                    if(_imagefile.isEmpty){
                      _errorDialog('请至少添加一张商品图片！');
                      return;
                    }
                         
                    if(await User_Manage().upload_goods(_goods,_summary,_chooseImagesPath)){
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    }else{
                      _errorDialog('上传失败！');
                      return;
                    }

                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width-70,
                    height: 50,
                    //color: Colors.amber,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: const Text(
                      '上架商品',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                      ),),
                  ),
                )
              ],
            )));
  }

  _errorDialog(content) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('确定'))
            ],
          );
        });
  }

  _Children() {
    List<MyImage> list = [];
    for (File image in _imagefile) {
      list.add(MyImage(image, (() {
        setState(() {
          _imagefile.remove(image);
        });
      })));
    }
    return list;
  }

  List<File> _imagefile = [];
  List<String> _chooseImagesPath = [];

  _onTapPickFromGallery() async {
    final List<AssetEntity>? entitys = await AssetPicker.pickAssets(context,
        pickerConfig: const AssetPickerConfig(maxAssets: 3));
    if (entitys == null) return;
    //遍历
    List<File> imagefile = [];
    List<String> chooseImagesPath = [];

    for (var entity in entitys) {
      File? imgFile = await entity.file;
      if (imgFile != null) {
        chooseImagesPath.add(imgFile.path);
        imagefile.add(imgFile);
      }
    }

    setState(() {
      _imagefile = imagefile;
      _chooseImagesPath = chooseImagesPath;
    });
  }
}

class MyImage extends StatelessWidget {
  File imagefile;
  void Function() onPressed;

  MyImage(this.imagefile, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 5,
      width: MediaQuery.of(context).size.width / 5,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.file(imagefile).image, fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(10)
          ),
      child: IconButton(
        color: Colors.red,
        alignment: Alignment.topRight,
        icon: const Icon(Icons.cancel),
        onPressed: onPressed,
      ),
    );
  }
}
