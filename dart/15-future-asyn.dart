import 'dart:async';

void main() {
  testScheduleMicrotask();
}

void testScheduleMicrotask() {
  scheduleMicrotask(() => print('s1'));

  new Future.delayed(new Duration(seconds: 1), () => print('s2'));

  new Future(() => print('s3'))
      .then((_) => new Future(() => print('s13')))
      .then((_) {
        print('s4');
        scheduleMicrotask(() => print('s5'));
      })
      .then((_) => print('s6'));

  new Future(() => print('s10'))
    .then((_) => new Future(() => print('s11')))
    .then((_) => print('s12'));

  new Future(() => print('s7'));

  scheduleMicrotask(() => print('s8'));

  print('s9');
}