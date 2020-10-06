import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridView Sample"),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //2列
              mainAxisSpacing: 50, //行间距
            ),
            itemCount: 100,
            itemBuilder: (context,index) {
              print('$index');
                  return Container(
                    color: Colors.red,
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      '$index',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  );
            }
        )//NormalGridViewWidget(),
      ),
    );
  }
}

class NormalGridViewWidget extends StatelessWidget {
  const NormalGridViewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,//3行
        scrollDirection: Axis.horizontal,
        childAspectRatio: 2/3, //child 高宽比
        children: List.generate(
            100,
                (index) {
                  return Container(
                    color: Colors.red,
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      '$index',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  );
                }
        )
    );
  }
}
