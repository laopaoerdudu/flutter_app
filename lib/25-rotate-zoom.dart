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

  //Curve类中定义各种插值器
  @override
  void initState() {
    super.initState();
    _animationController =
    AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _doubleAnim = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn))
      ..addStatusListener(myListener);
    _animationController.forward();
  }

  void myListener(status) {
    if (status == AnimationStatus.completed) {
      //当动画执行完毕之后，将监听去掉，并将其恢复，不然还是会重复执行这个完成的回调监听的
      _animationController.removeStatusListener(myListener);
      _animationController.reset();
      _doubleAnim = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn));
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget child) {
            var _screenWidth = MediaQuery.of(context).size.width; //获得屏幕宽度
            return Transform(
              transform: Matrix4.translationValues(
                //进行x平移操作
                  _doubleAnim.value * _screenWidth,
                  0.0,
                  0.0),
              child: Center(
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  child: FlutterLogo(),
                ),
              ),
            );
          }),
    );
  }
}

class MyLogo extends AnimatedWidget {
  MyLogo({Key key, @required Animation animation})
      : super(key: key, listenable: animation);
  final Tween<double> _rotateAnim = Tween<double>(begin: 0.0,end: 360.0);
  final Tween<double> _scaleAnim = Tween<double>(begin: 10.0,end: 40.0);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Transform.scale(
        scale: _scaleAnim.evaluate(animation),
        child: Transform.rotate(
            angle: _rotateAnim.evaluate(animation),
            child: Container(
              child: FlutterLogo(),
            ),
        ),
    );
  }
}