import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome wwe monday night raw'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //内容居中显示
            children: <Widget>[
              Text(
                'tttttttttttttttttttttttttttkkkkkkkkkkkkkkkkssssssssssssstestlkdkdkkd',
                maxLines: 1,
                overflow: TextOverflow.clip, //超出屏宽的将被裁剪
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 30, //文字尺寸加大
                    decorationStyle: TextDecorationStyle.wavy,//波浪样式
                ),//设置删除线
              ),

              //设置一个占位，其实也可以用margin，换种写法体验一下
              SizedBox(
                height: 10.0,
              ),

              RichText(
                  text: TextSpan(
                    text: 'kdkdkdkdkdkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk',
                    style: TextStyle(color: Colors.lightBlue,fontSize: 20.0),
                    children: <TextSpan>[
                      TextSpan(text: 'ssssssssssssssssssssss'),
                      TextSpan(
                        text: 'Click',
                        style: TextStyle(color: Colors.red),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async { //..是级联语法，Dart的特殊用法，联想sb..write()
                          String url = "http://www.baidu.com";
                          if(await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw "error : $url";
                          }
                      }),
                    ]


                  ))

            ],
          ),
        ),
      ),
    );
  }
}
