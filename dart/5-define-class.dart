
//Dart定义类，建议这么写
class Point {
  num x;
  num y;
  num z;

  //初始化实例参数
  Point(_x,_y)
      : x = _x,
        y = _y,
        z = _x + _y;

  //命名构造函数,名字可以随便定义
  Point.fromJson(Map json) {
    x = json['x'];
    y = json['y'];
  }

  Point.parseValue(x, y)
      : x = x,
        y = y {
    print("父类命名构造函数");
  }

  //重定向构造函数，使用冒号调用其他构造函数
  Point.reNameConstructure(String str) : this.parseValue(0,1);

//也可以调用
//Point.reNameConstructure(String str) : this(0,1);
}

class Child extends Point {
  num x;
  num y;
  String str;

  //若超类没有默认构造函数，需要手动调用超类其它构造函数
  Child(x,y) : super.parseValue(x,y) {
    print("子类构造函数");
  }

  //在构造函数的初始化列表中使用super(),需要把它放到最后
  Child.parseValue(x,y)
      : x = x,
        y = y,
        super.parseValue(x,y) {
    print("子类命令构造函数");
  }
}