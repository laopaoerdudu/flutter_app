import 'package:flutter/material.dart';

//演示对齐布局
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
        title: Text("Align Layout Sample"),
      ),
      body: Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            color: Colors.red,
            width: 200.0,
            height: 200.0,
          ),
        ),
      ),
    );
  }
}

