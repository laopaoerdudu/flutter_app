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

class HomePage extends StatelessWidget {
  final List<String> _items = List.generate(20, (index) => 'item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context,index) {
          final item = _items[index];
          return Dismissible(
            onDismissed: (_) {
              _items.removeAt(index);
            },
            movementDuration: Duration(microseconds: 100),
            background: Container(
              color: Colors.red,
            ),
            key: Key(item),
            child: ListTile(
              title: Text(item),
            ),
          );//每个条目支持滑动删除
        },
      ),
    );
  }
}

