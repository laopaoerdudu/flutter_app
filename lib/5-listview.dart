import 'package:flutter/material.dart';

//列表是最常见的需求。在Flutter中，用ListView来显示列表项，支持垂直和水平方向展示，
// 通过一个属性我们就可以控制其方向，列表有以下几类。
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView Sample"),
        ),
          body: LoadDataByNeedLlistViewWidget()//HorizontalListViewWidget()//NormalListViewWidget()
      ),
    );
  }
}

//按需来加载的列表
class LoadDataByNeedLlistViewWidget extends StatelessWidget {
  const LoadDataByNeedLlistViewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context,index) {
          print('$index');
          if(index.isOdd) {
            return Divider();
          }
          return ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('test-$index'),
            subtitle: Text('subTitle'),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        });
  }
}

//这种是一次性加载100条，而非按需加载
class HorizontalListViewWidget extends StatelessWidget {
  const HorizontalListViewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,//设置水平显示
      children: List.generate(100, (index) {
        return Text(
          '$index',
          style: TextStyle(
            fontSize: 20.0
          ),
        );
      }),
    );
  }
}

class NormalListViewWidget extends StatelessWidget {
  const NormalListViewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text("favoriate border"),
          subtitle: Text('sub favoriate border'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('favarite_border'),
          subtitle: Text('sub favoriate border'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('favarite_border'),
          subtitle: Text('sub favoriate border'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('favarite_border'),
          subtitle: Text('sub favoriate border'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
      ],
    );
  }
}
