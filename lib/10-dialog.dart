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
        title: Text("Material Dialog Sample"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SimpleDialog(
              title: Text('Material Dialog Title'),
              children: <Widget>[
                SimpleDialogOption(
                  child: Text('选择1'),
                  onPressed: () {
                    print('选择1');
                  },
                ),
                SimpleDialogOption(
                  child: Text('选择2'),
                  onPressed: () {
                    print('选择2');
                  },
                ),

                RaisedButton(
                    child: Text('删除'),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('title'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('是否删除?'),
                                    Text('删除后不可恢复!'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('确定'),
                                  onPressed: () {
                                    Navigator.of(context).pop(); //取消对话框
                                  },
                                ),
                                FlatButton(
                                  child: Text('取消'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          }
                      );
                    },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

