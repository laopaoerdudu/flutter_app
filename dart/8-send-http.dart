
import 'package:dio/dio.dart';
import '1-test.dart' deferred as lazyLib;

void getHttp() async {
  try {
    Response response = await Dio().get("http://www.baidu.com");
    lazyLoad();
    print(response);
  } catch (e) {
    print(e);
  }
}

lazyLoad() async {
  await lazyLib.loadLibrary();//使用 await 关键字暂停代码执行一直到库加载完成。
  lazyLib.test();
}