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
        title: Text('Material CardView Sample'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Image.asset(
                    'assets/graphics/mandy.jpg',
                  width: double.infinity, //宽度填满屏幕
                  height: 150.0,
                  fit: BoxFit.cover,//充满宽高
                ),
                Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Icon(Icons.home),
                        ),
                    ),
                    Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'test',
                              style: TextStyle(fontSize: 22.0),
                            ),
                            Text(
                              '500',
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          Text('66'),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


