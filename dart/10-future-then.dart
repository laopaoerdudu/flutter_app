
void main() {
  test3();
}

void test3() {
  new Future(() => futureTask())
      .then((i) => "This is $i")
      .then((p) => print(p))
      .then((_) => new Future.error("error!"))
      .whenComplete(() => print("All task already finished!"))
      .catchError((e) => print(e),test: (Object obj) {//这里的test写法，参考来源catchError的源码
    print('test');
    return false;//表示不捕获异常了
  });
}

void test2() {
  new Future(() => futureTask())
      .then((i) => "This is $i")
      .then((p) => print(p))
      .then((_) => new Future.error("error!"))
      .whenComplete(() => print("All task already finished!"))
      .catchError((e) => print(e));
}

void test1() {
  new Future(() => futureTask()) //异步任务的函数
      .then((i) => "This is $i")
      .then((p) => print(p))
      .then((_) => new Future.error("error!"))
      .whenComplete(() => print("All task already finished!"));
}

futureTask() {
  return 10;
}