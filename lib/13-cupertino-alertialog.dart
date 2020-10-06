import 'package:flutter/cupertino.dart';
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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ios Cupertino AlertDialog Sample'),
      ),
      body: Center(
        child: CupertinoAlertDialog(
          title: Text("Cupertino AlertDialog Title"),
          content: Text('test'),
          actions: <Widget>[
            CupertinoDialogAction(
                child: Text('取消'),
            ),
            CupertinoDialogAction(
              child: Text('确定'),
            ),
          ],
        ),
      ),
    );
  }
}

