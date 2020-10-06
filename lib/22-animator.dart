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

//当创建一个AnimationController时，需要传递一个vsync参数，
// 存在vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源。
//通过将SingleTickerProviderStateMixin添加到类定义中，可以将stateful对象作为vsync的值。
// 如果要使用自定义的State对象作为vsync时，请包含TickerProviderStateMixin。
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  Animation<double> _doubleAnim;
  AnimationController _animationController;
  String _animaValue;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _doubleAnim = Tween(begin: 0.0,end: 1.0).animate(_animationController)
    ..addListener(() {
      setState(() {
        _animaValue = _doubleAnim.value.toString();
      });
    })..addStatusListener((status) {
      print(status);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_animaValue ??= '0.0'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController.forward(from: 0.0);//开启动画
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  //当State对象从树中被永久被移除时调用，通常在此回调中释放资源
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();//FIXME DONT forget
  }
}

