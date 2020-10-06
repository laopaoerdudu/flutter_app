
void main() {
  getName1();
  getName2();
  getName3();
  getName4();
}

Future getName1() async {
  await getStr1(); //遇到await执行，立刻返回，接着走完main主流程
  await getStr2();
  print('getName1');
}

getStr1() {
  print('getStr1');
}

getStr2() {
  print('getStr2');
}

getName2() {
  print('getName2');
}

getName3() {
  print('getName3');
}

getName4() {
  print('getName4');
}
