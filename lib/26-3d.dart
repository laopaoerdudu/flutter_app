import 'package:flutter/material.dart';

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

//对于在屏幕中移动的点,不管是垂直还是水平还着其它方向的，手势触发就会回调这个函数 onPanUpdate
//双击的事件监听 -> onDoubleTap
class _HomePageState extends State<HomePage> {

  //定义一个坐标点
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter ListView之3d示例'),
      ),
      body: Center(
        child: Transform(
          transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)//将其设置为3行2列才是3D的视角
          ..rotateX(_offset.dy * 0.1)
          ..rotateY(_offset.dx * 0.1),
          //加一个手势
          child: GestureDetector(
            child: Container(
              color: Colors.red,
              width: 200.0,
              height: 200.0,
            ),
            onPanUpdate: (details) {
              setState(() {
                _offset += details.delta; //手势触发时进行坐标点的更新
              });
            },
            onDoubleTap: () {
              setState(() {
                _offset = Offset.zero;
              });
            },
          ),
        ),
      ),
    );
  }
}