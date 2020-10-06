

//实现call()方法可以让类像函数一样能够被调用。
class ClassFunction {
  call(String a,String b) => '$a vs $b';
}

void main() {
  var cf = new ClassFunction();
  var out = cf("Roman","Seth");
  print(out);
  print(out.runtimeType);
  print(cf.runtimeType);
  print(cf is Function);
  print(out is Function);
}