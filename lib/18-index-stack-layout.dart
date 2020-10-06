import 'dart:math';

import 'package:flutter/material.dart';

//用于显示第index个child，其他child不可见，所以它的尺寸与child中最大尺寸一致。
//动态切换child的效果
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Index Stack Sample"),
      ),
      body: Center(
        child: buildIndexStackWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index = Random().nextInt(2) % 2; //让index随机改成0或1
          });
        },
      ),
    );
  }

  Stack buildIndexStackWidget() {
    return IndexedStack(
      index: _index,
      alignment: Alignment(1.2, -1.2),
      children: <Widget>[
        Container(
          color: Colors.lightBlue,
          width: 200.0,
          height: 200.0,
        ),
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.red,
        ),
      ],
    );
  }
}



