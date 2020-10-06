
class Rectangle {
  num left;
  num top;
  num width;
  num height;

  Rectangle(this.left,this.top,this.width,this.height);

  //可以通过实行 get 和 set 来创建新的属性
  num get right => left + width;

  set right(num value) => left = value - width;
}