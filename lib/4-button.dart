import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//要实现交互图标，可以考虑使用IconButton组件
//IconButton：可交互的Icon，图标按钮组件IconButton是基于Meterial Design风格的组件，
// 可以响应按下的事件，并且按下时带水波纹效果。
// 如果它的onPressed回调函数为null，那么这个按钮处于禁用状态
//RaisedButton：是Material Design中的button，一个凸起的材质矩形按钮，它可以响应按下事件，并且按下时会带一个触摸效果。
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("icons_button sample"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.camera),
              SizedBox(
                height: 10.0,
              ),
              IconButton(
                  icon: Icon(Icons.image),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: 'This is IconButton Event Toast',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                    );
                  }
              ),
              RaisedButton(
                  child: Text('RaisedButton Sample'),
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: 'This is RaisedButton Event Toast',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
