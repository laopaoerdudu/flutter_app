//演示Dart语言重的自定义注解

class ToDo {
  final String who;
  final String what;

  const ToDo({this.who,this.what});
}

void main() {
  dynamic tv = new Television();
  tv.doSomething();
}

class Television {
  @ToDo(who: 'David',what: 'create a new method')
  void doSomething() {
    print('doSomething');
  }
}