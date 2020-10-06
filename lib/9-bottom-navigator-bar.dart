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
  int _currentIndex = 0;
  final _widgetOptions = [
    Text('信息'),
    Text('通讯录'),
    Text('发现'),
    Text('我'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigatorBar Sample'),
        centerTitle: true,
        leading: Icon(Icons.star),
        elevation: 0.0, //标题栏下的阴影控制
        actions: <Widget>[
          Icon(Icons.search),
          Icon(Icons.more_vert),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/other');
        },
        tooltip: '路由跳转',
        foregroundColor: Color(0xffffffff),
        backgroundColor: Color(0xff000000),
        //阴影
        elevation: 0.0,
        child: Icon(Icons.arrow_forward),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('信息'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('通讯录'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.near_me),
            title: Text('发现'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('我'),
          ),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),

      //侧滑抽屉
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //展示用户头像、用户名
            UserAccountsDrawerHeader(
              accountName: Text('David'),
              accountEmail: Text('13539403267@163.com'),
              otherAccountsPictures: <Widget>[
                Icon(Icons.camera_alt),
              ],
              //设置背景颜色或图片
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/graphics/seth.jpg'),
                  fit: BoxFit.fill
                )
              ),
              //用户头像
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/women/56.jpg'
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('会员特权'),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('会员特权'),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('会员特权'),
            ),
            AboutListTile(
              icon: Icon(Icons.error),
              child: Text('关于'),
              applicationName: 'test',
              applicationVersion: 'v1.0.0',
            )
          ],
        ),
      ),
    );
  }
}
