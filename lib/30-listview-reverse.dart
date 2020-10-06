import 'dart:math';

import 'package:flutter/material.dart';

//ListView的条目重排序功能
void main() => runApp(MaterialApp(
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = List.generate(Random().nextInt(15) + 1, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter 列表重排序示例'),
        ),
        body: ReorderableListView(
          onReorder: _onReorder, //移动的回调
          children: list
              .map((m) => ListTile(
            key: ObjectKey(m),
            title: Text(m),
          ))
              .toList(),
        ));
  }

  _onReorder(int oldIndex, int newIndex) {
    print('oldIndex: $oldIndex, newIndex: $newIndex');
    setState(() {
      if(newIndex == list.length) {
        newIndex = list.length - 1;
      }
      var item = list.removeAt(oldIndex);
      list.insert(newIndex, item);
    });
  }
}