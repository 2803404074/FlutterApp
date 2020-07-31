//启动辅助类
//检测用户状态等

import 'dart:async';

import 'http/ImageDownHttp.dart';

typedef JudegeCallback = void Function(String value, bool status);

class MainHelpe {
  //倒计时期间检测以下操作
  //1.身份校检，成功将此值设置为true，失败需要注册游客，游客注册成功将此值设置为true
  var isIdentity = false;
  //2.获取广告状态
  var isLoadAdv = false;
  //3.全局初始化状态
  var isOverAll = false;

  Timer countdownTimer;
  var seconds = 10;

  bool juegeUser(JudegeCallback callback) {
    countdownTimer =
        new Timer.periodic(new Duration(milliseconds: 500), (timer) {
      if (seconds > 0) {
        seconds--;
        //每过500毫秒检测一次所有状态是否顺利完成
        if (isIdentity && isLoadAdv && isOverAll) {
          print('所有校检成功,开始加载首个广告位');
          disCountdownTimer();
          //如果都成功了，先解码第一个需要显示的广告，减少解密过程中出现白屏的时间。
          ImageDownHttp.getInstance().startDownLoad(
              'http://image.i438500.com/storage/images/app/banner/49edc9d335cc4784c7d33deaa4e526d4.raw',
              (values, status) {
            callback(values, status);
          });
        }
      } else {
        //连接超时提示
        print('超时提示');
        disCountdownTimer();
        callback('', false);
      }
    });

    //开始执行一系列校检操作
    //这里先模拟延迟执行
    Future.delayed(Duration(milliseconds: 1500), () {
      isIdentity = true;
      print('身份校检成功');
    });

    Future.delayed(Duration(milliseconds: 500), () {
      isLoadAdv = true;
      print('广告初始化成功');
    });

    Future.delayed(Duration(milliseconds: 800), () {
      isOverAll = true;
      print('全局初始化成功');
    });
  }

  void disCountdownTimer() {
    if (countdownTimer != null) {
      countdownTimer.cancel();
      countdownTimer = null;
    }
  }
}
