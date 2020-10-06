void main() {
  getName1();
  getName2();
  getName3();
}

Future getName1() async {
  await getStr();//此时会将getStr()添加到事件队列中，然后并返回Future
  print('getName1');//这个暂时不会打印了，然后又加到main()的主流程继续往下执行了，当整个main()方法都执行完之后，最后再来执行它，所以它最后打印
}

getStr() {
  print('getStr');
}

getName2() {
  print('getName2');
}

getName3() {
  print('getName3');
}

