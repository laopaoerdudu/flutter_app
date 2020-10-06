
[基础笔记：](https://www.cnblogs.com/webor2006/p/11975291.html)

//相当于给方法取了个行为名，满足这种形式的函数都可以用它来接收。
typedef MyFunction(int a,int b)

[依赖包获取地址：](https://pub.dev/)

### 隔离-Isolates：

- Dart没有共享内存的并发，没有竞争的可能性所以不需要锁，也就不用担心死锁的问题。

- isolate之间没有共享内存，所以他们之间的通信唯一方式只能是通过Port进行，而且Dart中的消息传递总是异步的。

- isolate神似Thread，但实际上两者有本质的区别。操作系统内的线程之间是可以有共享内存的而isolate没有，这是最为关键的区别。

- 所有Dart代码都在隔离区内运行，而不是线程。每个隔离区都有自己的内存堆，确保不会从任何其他隔离区访问隔离区的状态。

- 这里了解一下概念既可，也就是我们在main()其实不是运行在线程当中的，跟Java是不一样的。

**需要特别注意：在Dart中木有interface关键字，abstract就可以当接口来用**

**只有定义一个工厂构造函数，才可以实例化**

### 指定库前缀

    import 'diff/MyLib1.dart' as lib1;

### 选择性载入

- show -只载入库的某些部分

- hide -不加载库的某些部分

### 延迟载入

    import 'diff/MyLib1.dart' deferred as 'name'

### Event-Looper

- 一个消息循环的职责就是不断从消息队列中取出消息并处理他们直到消息队列为空。

- 消息队列中的消息可能来自用户输入，文件I/O消息，定时器等。例如上图的消息队列就包含了定时器消息和用户输入消息。

- Dart中的Main Isolate只有一个Event Looper，但是存在两个Event Queue: Event Queue以及Microtask Queue。

**Event-Queue和Microtask Queue：**

- 优先全部执行完Microtask Queue中的Event。

- 直到Microtask Queue为空时，才会执行Event Queue中的Event。

### scheduleMicrotask()：

- 使用Future的then方法或whenComplete方法来指定任务顺序。

- 为了保持你app的可响应性，尽量不要将大计算量的任务放入这两个队列。
  大计算量的任务放入额外的isolate中。

