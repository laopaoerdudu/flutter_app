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
        title: Text("Table Layout Sample"),
      ),
      body: Center(
        child: Table(
          columnWidths: const <int,TableColumnWidth> {
            0: FixedColumnWidth(50.0),
            1: FixedColumnWidth(50.0),
            2: FixedColumnWidth(50.0),
            3: FixedColumnWidth(50.0),
          },
          border: TableBorder.all(
            color: Colors.black,
            width: 1.0
          ),

          children: const<TableRow>[
            TableRow(
                children: [
                  Text("头像"),
                  Text("姓名"),
                  Text("年龄"),
                  Text("身高"),
                ]
            ),

            TableRow(
                children: [
                  Icon(Icons.account_circle),
                  Text("张三"),
                  Text("21"),
                  Text("160"),
                ]
            ),

            TableRow(
                children: [
                  Icon(Icons.account_circle),
                  Text("李四"),
                  Text("24"),
                  Text("170"),
                ]
            ),

            TableRow(//第四行
                children: [
                  Icon(Icons.account_circle),
                  Text("王五"),
                  Text("40"),
                  Text("178"),
                ]
            ),
          ],
        ),
      ),
    );
  }
}

