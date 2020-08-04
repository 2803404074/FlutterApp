import 'package:dio/dio.dart';

typedef ResponseCallback = void Function(String value, bool status);

/*
 * 下载工具类
 */
class ImageDownHttp {
  static ImageDownHttp _instance;
  static Dio dio;
  ImageDownHttp._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory ImageDownHttp.getInstance() => _getInstance();

  /// 获取单例内部方法
  static _getInstance() {
    // 只能有一个实例
    if (_instance == null) {
      _instance = ImageDownHttp._internal();
      dio = new Dio();
      dio.options.connectTimeout = 5000; // 服务器链接超时，毫秒
      dio.options.receiveTimeout = 5000; // 响应流上前后两次接受到数据的间隔，毫秒
    }
    return _instance;
  }

  Future<String> startDownLoad(String url, ResponseCallback callback) async {
    try {
      Response response = await dio.get(url);

      if (response.statusCode != 200) {
        print('下载文件异常+++++++++++++++++++++');
        callback('', false);
      } else {
        print('下载文件正常*************************');

        //读取的网络内容
        var readData = response.data.toString();

        //1.获取文件名
        String imgName = getRowName(url);
        print('文件名=$imgName');

        //2.获取偏移量arg0（提取文件名所有数字并累加）
        var arg0 = getNameNumBer(imgName);
        print('偏移量arg0=$arg0');

        //3.获取偏移量arg1（偏移量arg0*arg0）
        var arg1 = arg0 * arg0;
        print('偏移量arg1=$arg1');

        //4.获取偏移量arg1的前三位数
        var arg1TopThree = arg1.toString().substring(0, 3);
        print('偏移量arg1前三位=$arg1TopThree');

        var a = arg1TopThree[0];
        var b = arg1TopThree[1];
        var c = arg1TopThree[2];
        print('第一位=${a},第二位=${b},第三位=${c}');

        var name1 = imgName[int.parse(a)].toUpperCase();
        var name2 = imgName[int.parse(b)].toUpperCase();
        var name3 = imgName[int.parse(c)].toUpperCase();
        print('文件名对应偏移量arg1的第一位=$name1');
        print('文件名对应偏移量arg1的第二位=$name2');
        print('文件名对应偏移量arg1的第三位=$name3');

        //替换的字符串
        var longStremStr = readData
            .replaceAll('*', name1)
            .replaceAll('@', name2)
            .replaceAll('&', name3);

        print('替换字符串成功');

        //计算最后一行的字符串长度
        int size = ((longStremStr.length) / (arg0 + 1)).floor();
        //var sizeZ = int.parse(size.toString());
        print('size = $size');

        //拼接字符串(base64字符串)
        var str = '';
        for (int i = 0; i <= size; i++) {
          if (i == size) {
            str += longStremStr.substring(
                i * arg0 + i, longStremStr.length - 1 + 1);
          } else {
            str += longStremStr.substring(i * arg0 + i, i * arg0 + i + arg0);
          }
        }

        print('返回加密字符串-------------------------------');
        //回调
        callback(str, true);
      }
    } on DioError catch (e) {
      print('下载文件异常-------------------------------');
      callback('', false);
    }
  }

  String getRowName(String url) {
    var picName = url.substring(url.lastIndexOf('/') + 1);
    var picNameLast = picName.substring(0, picName.indexOf(".")); //截取.之前的字符串
    return picNameLast;
  }

  int getNameNumBer(String str) {
    var number = 0;
    RegExp numbers = new RegExp(r"[0-9]");
    Iterable<Match> matches = numbers.allMatches(str);
    for (Match ma in matches) {
      var a = ma.groups([0]);
      number += int.parse(a.first);
    }
    return number;
  }
}
