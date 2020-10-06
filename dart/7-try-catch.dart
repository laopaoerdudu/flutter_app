

void main() {
  try {
    throw "我窜稀了";//抛出任意非null对象
  } on String {
    //on 指定异常类型
    print("类型异常捕获...");
  } catch(e,s) {
    //on捕获后，则不会执行catch
    print(e);
    print(s);//默认是一个堆栈信息 (一个 StackTrace 对象)。
  } finally {
    print('end');
  }
}