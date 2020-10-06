
import '9-interface-implement.dart';
import 'part/1-part.dart';

void test() {
  print("Burn it down.");
}

void main() {
  test2();
}

void test2() {
  printPart1();
  printPart2();
  printPart3();
}

void test1() {
  var msg = Message('foot');
  msg.doMessage();
}