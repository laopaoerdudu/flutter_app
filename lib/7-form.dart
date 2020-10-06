import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//表单里有两个重要的组件，一个是Form组件，用来左整个表单提交使用的；
//另一个是TextFormField组件，用来做用户输入的。
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Sample'),
        ),
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _userName;
  String _pwd;
  GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  void _login() {
    var _loginForm = _loginKey.currentState;
    if(_loginForm.validate()) {
      _loginForm.save();
      print("Login sucessful");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                  key: _loginKey,//FIXXME: Dont forget
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Pls type the user name'),
                        onSaved: (value) {
                          print('$value');
                          _userName = value;
                        },
                        onFieldSubmitted: (value) {
                          print("onFieldSubmitted: $value");
                        },
                      ),

                      TextFormField(
                        obscureText: true,//改成密文
                        decoration: InputDecoration(labelText: 'Pls type the password'),
                        onSaved: (value) {
                          print('$value');
                          _pwd = value;
                        },
                        validator: (value) {
                          return value.length < 6 ? "The password length less then six" : null;
                        },
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        width: 400,
                        height: 40,
                        child: RaisedButton(
                            child: Text('Login'),
                            onPressed: () {
                              _login();
                            }),
                      )
                    ],
                  )
              ),
            )
          ],
        ),
    );
  }
}

