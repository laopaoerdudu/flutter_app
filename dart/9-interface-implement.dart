
//需要特别注意：在Dart中木有interface关键字，abstract就可以当接口来用
//只有定义一个工厂构造函数，才可以实例化
abstract class Message {
  // ignore: missing_return
  factory Message(String type) {
    switch (type) {
      case 'foot' :
        return FootMessage();
      case 'back' :
        return BackMessage();
      case 'special' :
        return SpecialMessage();
    }
  }

  void doMessage();
  void doContent() {}
}

class FootMessage implements Message {

  @override
  void doContent() {
    print("足底按摩是正规服务。");
  }

  @override
  void doMessage() {
    print("足底按摩");
  }
}

class BackMessage implements Message {

  @override
  void doContent() {
    print("开背按摩是正规服务。");
  }

  @override
  void doMessage() {
    print("开背按摩");
  }
}

class SpecialMessage implements Message {

  @override
  void doContent() {
    print("特殊服务是违法的，要小心哦。");
  }

  @override
  void doMessage() {
    print("特殊服务");
  }
}