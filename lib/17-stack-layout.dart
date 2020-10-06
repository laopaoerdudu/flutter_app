import 'package:flutter/material.dart';

//它可以理解成Android中的FrameLayout，它通常会结合Alignment和Positioned来使用，
// 像平常未读消息气泡布局就比较适合用它，
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Layout Sample"),
      ),
      body: Center(
        child: Stack(
          //alignment: Alignment.topRight,
          alignment: Alignment(1.2, -1.2),
          children: <Widget>[
            Container(
              color: Colors.lightBlue,
              width: 200.0,
              height: 200.0,
            ),
            Positioned(
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.red,
                ),
            )
          ],
        ),
      ),
    );
  }
}

