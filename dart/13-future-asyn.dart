
void main() {
  //这些代码都是Future相关的，所以执行在main()之后
  Future f1 = new Future(() => print("f1"));
  Future f2 = new Future(() => null);
  Future f3 = new Future(() => null);
  Future f4 = new Future(() => null);

  f4.then((_) => print("Step1"));
  f3.then((_) {
    print("Step2");
    new Future(() => print("Step3"));
    f2.then((_) => print("Step4"));
  });
  f2.then((m) => print("Step5"));
  print("Step6");
}

//分析上面的代码执行过程
//1,这些代码都是Future相关的，所以执行在main()之后,那么首先会打印 step6

//2,然后f1,f2,f3,f4分别入Event Quene，先进先执行，所以这个时候会打印 f1

//3，接下来执行f2，那么会打印 Step5

//4,接下来执行f3,那么会打印 Step2,
//然后又有新的Step3进入Event Quene，
//f2 已经在之前执行过了一次then，执行完了，此时再执行then则会将其放到微队列【Microtask Quene】
//而微队列的优先级别比较高，如果发现有数据则会立马打印，
// 所以这个时候会打印  Step4
//此时f3.then()的代码就执行完了

//接下来再执行f4.then,所以这个时候会打印 Step1

//最后再执行 new Future(() => print("Step3"))，打印  Step3

//所以最终的打印顺序是 step6 -> f1 -> Step5 -> Step2 -> Step4 -> Step1 -> Step3

//任务调度：直到Microtask Queue为空时，才会执行Event Queue中的Event。

//当Event Looper正在处理Microtask Queue中的Event时候，Event Queue中的Event就停止了处理了，
// 此时App不能绘制任何图形，不能处理任何鼠标点击，不能处理文件IO等等。
//绘制图形，处理鼠标点击，处理文件IO等都是在Event Queue里完成的。