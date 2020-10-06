import 'package:flutter/material.dart';

//AppBar和SliverAppBar都继承自StatefulWidget，两者的区别在于AppBar的位置是固定在应用最上面的；而SliverAppBar是可以跟随内容滚动的。
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/other': (BuildContext contetx) => OtherPage()},
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Router Sample'),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/other');
        },
        tooltip: '路由跳转',
        foregroundColor: Color(0xffffffff),
        backgroundColor: Color(0xff000000),
        elevation: 0.0,//阴影
        child: Icon(Icons.arrow_forward),
        shape: RoundedRectangleBorder(), //圆形变方形
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OtherPage'),
      ),
    );
  }
}
