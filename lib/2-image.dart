import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;//配置UI调试开关
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Clash of Champions 2020'),
        ),
        body: Center(
          //这里用一种列布局，来显示多种不同的类型图片加载,类似于线性布局
          child: Column(
            children: <Widget>[
              Image.network(
                "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3034071742,1954908597&fm=26&gp=0.jpg",
                width: 50.0,
                height: 50.0,
              ),
              Image(
                image: AssetImage('assets/graphics/mandy.jpg'),
                width: 100,
                height: 100,
              ),
              MemoryImageWidget(),
              FileImageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class MemoryImageWidget extends StatefulWidget {
  @override
  _MemoryImageWidgetState createState() => _MemoryImageWidgetState();
}

//加载Uint8List内存资源图片：先要将图片转成Uint8List类型
class _MemoryImageWidgetState extends State<MemoryImageWidget> {
  Uint8List bytes;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/graphics/seth.jpg').then((data) {
      if(mounted) {
        setState(() {
          bytes = data.buffer.asUint8List(); //在初始化的时候进行转换，这一步完成数据加载
        });
      }
    });
  }

  //最终将bytes通过setState来更新UI
  @override
  Widget build(BuildContext context) {
    final _decoration = BoxDecoration(
      image:
        bytes == null ? null : DecorationImage(image: MemoryImage(bytes))
    );
    return Container(
      width: 100,
      height: 100,
      decoration: _decoration,
    );
  }
}

//从相册选择图片
class FileImageWidget extends StatefulWidget {
  @override
  _FileImageWidgetState createState() => _FileImageWidgetState();
}

class _FileImageWidgetState extends State<FileImageWidget> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: _image == null
          ? Text(
              '未选择图片',
            style: TextStyle(color: Colors.red),
          )
          : Image.file(
            _image,
            width: 100,
            height: 100,
          )
        ),
        FlatButton(
          onPressed: getImage,
          child: Text(
            '选择图片',//此时咱们点击“选择图片”时，则需要跳到相册中来进行图片的选择，该如何做呢？这里需要用到一个image_picker三方开源库,看ymal文件
            style: TextStyle(color: Colors.lightBlue),
          ),
        )
      ],
    );
  }
}

