import 'dart:math';

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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

 AnimationController _animationController;
 Animation<double> _animation;
 bool reversed;

  _doAnim() {
    reversed ? _animationController.reverse() : _animationController.forward();
    reversed = !reversed;
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );

    _animation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 0.0,end: -pi / 2), //0 ~ -90度
          weight: 0.5),

      TweenSequenceItem(
          tween: Tween(begin: pi / 2, end: 0), //0 ~ -90度
          weight: 0.5),
      //0.5秒
    ]).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Flipper Sample'),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context,Widget child) {
              return Transform(
                  transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(_animation.value),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: _doAnim,
                  child: IndexedStack(
                    children: <Widget>[
                      Card1(),
                      Card2(),
                    ],
                    alignment: Alignment.center,
                    index: _animationController.value < 0.5 ? 0 : 1,
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Container(
          width: 200.0,
          height: 200.0,
          child: Center(
            child: Text(
              '点我看密码',
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          )),
    );
  }
}

class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Container(
          width: 200.0,
          height: 200.0,
          child: Center(
            child: Text(
              '123456',
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          )),
    );
  }
}