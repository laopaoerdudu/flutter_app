
//定义常量构造函数
class Mother {
  //定义const构造函数，要确保所有实例变量必须用final修饰
  final String name;
  final num age;
  static final Mother stub = const Mother("san", 45);

  //一定不能有函数体
  const Mother(this.name, this.age);

  @override
  String toString() {
    return 'Mother{name: $name, age: $age}';
  }
}

void main() {
  Mother mother = const Mother("du",35);
  print(mother);
}