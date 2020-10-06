

class Vector {
  final int x;
  final int y;

  const Vector(this.x,this.y);

  Vector operator +(Vector v) {
    return Vector(x + v.x,y+v.y);
  }

  Vector operator -(Vector v) {
    return Vector(x - v.x, y - v.y);
  }

  @override
  String toString() {
    return 'Vector{x: $x, y: $y}';
  }
}