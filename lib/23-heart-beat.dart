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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation<double> _doubleAnim;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..forward();
    _doubleAnim = Tween(begin: 20.0, end: 100.0).animate(_animationController)
      ..addListener(() {
        setState(() {});//让其widget进行更新
      })
      ..addStatusListener((status) {
        //监听动画状态让其动画循环播放
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: _doubleAnim.value,
          height: _doubleAnim.value,
          color: Colors.red,
        ),
      ),
    );
  }
}