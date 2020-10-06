
//单例则使用 factory 来定义这个构造函数。
class Singleton {
  String name;

  //工厂构造函数无法访问this,所以要用static
  static Singleton _cache;

  factory Singleton([String name  = 'singleton']) =>
      Singleton._cache ??= Singleton._newObject(name);

  //定义一个命名构造函数用来生产实例
  Singleton._newObject(this.name);
}