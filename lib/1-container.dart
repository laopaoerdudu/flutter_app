import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('WWE Super Start'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(top: 20),
              width: 200,
              height: 200,
              child: Text(
                  'WWE Raw',
                  style: TextStyle(fontSize: 28.0),
              ),

              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.lightBlue,
                  width: 10.0
                ),
                  borderRadius:
                    const BorderRadius.all(const Radius.circular(25.0))
              ),
              //color: Colors.red,  //color冲突了，保留Colors.lightBlue
              transform: Matrix4.rotationZ(-pi / 9) //逆时针将Container旋转一下
          ),
        ),
      ),
    );
  }
}
