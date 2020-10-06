import 'dart:async';

void main() {
  testScheduleMicrotask();
}

void testScheduleMicrotask() {
  scheduleMicrotask(() => print('s1'));

  //Future有个delay，它肯定是Future中最后一个执行的
  new Future.delayed(new Duration(seconds: 1),() => print('s2'));

  new Future(() => print('s3')).then((_) => {
    print('s4'),
    scheduleMicrotask(() => print('s5'))
  }).then((_) => print('s6'));

  new Future(() => print('s7'));

  scheduleMicrotask(() => print('s8'));

  print('s9');
}

//分析执行步骤：
//由于这些都是与Future相关的，肯定在main()后面执行，所以先打印 s9

//scheduleMicrotask的意思是生成一个微任务，则会放入微队列中
//而由于微对队的优先级比事件队列的优先级要高，所以立马会打印 s1

//接下来会打印s8

//此时要注意啦！！！
// 有then的情况下是需要先将then全部执行完之后，再来执行微任务，
// 不要看到微任务就立马输出，因为微任务是在then中创建的，先要将then执行完，所以输出为：
//s3 -> s4 -> s6 -> s5

//接下来就是执行s7

//最后执行s2