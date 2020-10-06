import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var images = [
    'assets/graphics/seth.jpg',
    'assets/graphics/seth.jpg',
    'assets/graphics/seth.jpg',
    'assets/graphics/seth.jpg',
    'assets/graphics/seth.jpg',
    'assets/graphics/seth.jpg',
    'assets/graphics/seth.jpg',
    'assets/graphics/seth.jpg',
    'assets/graphics/seth.jpg',
    'assets/graphics/seth.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter listview_3d示例'),
        ),
        body: Center(
          child: ListWheelScrollView(
            perspective: 0.003,
            diameterRatio: 2.0, //直径比
            itemExtent:
            MediaQuery.of(context).size.height * 0.6, //item的高度占整个屏幕的6成
            children: images
                .map((m) => Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                //设置圆角
                  borderRadius: BorderRadius.circular(20.0)),
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    m,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 30.0,
                    left: 30.0,
                    child: Text(
                      'Seth Rollins',
                      style: TextStyle(
                          color: Colors.white, fontSize: 30.0),
                    ),
                  )
                ],
              ),
            ))
                .toList(),
          ),
        ));
  }
}