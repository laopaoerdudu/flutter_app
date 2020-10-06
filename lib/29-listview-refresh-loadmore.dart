import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = new List();
  ScrollController _scrollController;//实现下拉加载更多

  @override
  void initState() {
    super.initState();
    _refresh();
    _scrollController = ScrollController()
      ..addListener(() {
        //判断是否滑到底
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          _loadMore();
        }
      });
  }

  Future _loadMore() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        list.addAll(
            List.generate(Random().nextInt(5) + 1, (i) => 'load more Item $i'));
      });
    });
  }

  //这里就需要使用async和await来模拟异步请求了
  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 3),() {
      setState(() {
        list = List.generate(Random().nextInt(20) + 15, (index) => 'refresh Item $index');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter 下拉刷新、上拉加载示例'),
        ),
        body: Center(
          child: RefreshIndicator(
            displacement: 20, //控制下拉刷新的距离
            child: (list == null || list.isEmpty) ? Center(
              child: CircularProgressIndicator(),
            ) : ListView.builder(
                controller: _scrollController,
                itemCount: list.length + 1,//多加一个1是为了了实现分页的效果
                itemBuilder: (context,index) {
                  if(index == list.length) {
                    //如果是最后一行，则增加一个loading
                    return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                    );
                  }
                  return ListTile(
                    title: Text(list[index]),
                  );
                }
            ),
            onRefresh: _refresh,
          ),
        ));
  }
}