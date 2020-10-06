
void main() {
}

int add(int a,[int b,int c]) {
  return a + 3;
}

//这里也可以用冒号取代等号，但是冒号的方式使用是有风险的，这特性可能未来被未移除掉，建议统一用=号既可，
int add2(int a, [int b = 1, int c =2]) => a + b;

//可以使用list或map作为默认值，但必须是const 。
void add3({List list = const[1, 2, 3]}) {

}

void test2() {
  bool isPaused;
  isPaused = isPaused ?? false;
  print(isPaused);
}

void test1() {
  bool flag = false;
  String str = flag ? "true" : "false"; //Dart的三目运算符
  print(str);
}

void test3() {
  String label = '''
    aaaa;
    bbbbbbb;
    cccccccccc;
  ''';
  print(label);
}

void test4() {
  StringBuffer sb = new StringBuffer();
  sb..write("a")..write("bb")..write("ccc");
  print(sb.toString());
}

void test6() {
  dynamic data = 123;
  data = "sb";
  print(data);
}

void test5() {
  print(Map);
  print(List);
  print(String);
}

void test9() {
  final List data = [1,2,3];
  final List data1 = [1,2,3];
  print(identical(data,data1)); // identical用于检查两个引用是否指向同一个对象
}

void test8() {
  dynamic data = 123;
  data.test();//dynamic修饰的变量在编译期间是不检查类型的
}

void test7() {
  Object obj = 123;
  obj = "Fuck";
  print(obj);
}

void test12() {
  String str;
  str ??= "2b";
  print(str);
}

void test11() {
  final d = DateTime.now();
  print(d);//这里换成const就会报错，因为const修饰的是编译时常量
}

void test10() {
  const List data = [1,2,3];
  const List data1 = [1,2,3];
  //相同的const常量不会在内存中重复创建。
  print(identical(data,data1));
}



