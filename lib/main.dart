import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/main_helpe.dart';
import 'navigator/tab_navigator.dart';

/**
 * 启动、广告逻辑
 */
void main() {
  MainHelpe mainHelpe = MainHelpe();

  mainHelpe.juegeUser((str, status) {
    runApp(MyApp(str, status));
  });
}

class MyApp extends StatefulWidget {
  var base64Str = '';
  bool initStatus;
  MyApp(String baseStr, bool initStatus) {
    print('进入MyApp');
    this.base64Str = baseStr;
    this.initStatus = initStatus;
  }
  @override
  _MyAppPageState createState() =>
      _MyAppPageState(this.base64Str, this.initStatus);
}

class _MyAppPageState extends State<MyApp> with AutomaticKeepAliveClientMixin {
  @override
  // 保存页面存活
  bool get wantKeepAlive => true;
  _MyAppPageState(String base64Str, bool initStatus) {
    this.base64Str = base64Str;
    this.initStatus = initStatus;
  }
  bool initStatus;
  var base64Str = '';
  bool isMissingAdv = false;

  Timer _timer;
  int count = 5;

  startTime() async {
    //设置启动图生效时间
    var _duration = new Duration(seconds: 1);
    new Timer(_duration, () {
      // 空等1秒之后再计时
      _timer = new Timer.periodic(const Duration(milliseconds: 1000), (v) {
        count--;
        if (count == 0) {
          _timer.cancel();
        }
        setState(() {});
      });
      return _timer;
    });
  }

  @override
  void initState() {
    print('进入initstate');
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    print('进入dispose');
    // TODO: implement dispose
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    super.dispose();
  }

  Widget showErrMessage(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0x00ffffff),
    );
  }

  @override
  Widget build(BuildContext context) {
    //
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    print('广告进入');
    if (!initStatus) {
      return showErrMessage(context);
    } else {
      return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: Stack(
            children: <Widget>[
              TabNavigator(),
              Offstage(
                offstage: isMissingAdv,
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.white,
                              width: double.infinity,
                              child: this.base64Str != ''
                                  ? Image.memory(
                                      base64.decode(this.base64Str),
                                      height: double.infinity,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      gaplessPlayback: true,
                                    )
                                  : Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      color: Colors.red,
                                    ),
                            )),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Image.asset(
                            'images/app_adv_bottom.jpg',
                            width: 220,
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      width: double.infinity,
                      child: GestureDetector(
                        child: Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(top: 40, right: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0x80000000),
                                borderRadius: BorderRadius.circular(1000)),
                            child: Stack(
                              children: <Widget>[
                                Offstage(
                                  offstage: count == 0 ? true : false,
                                  child: Text(
                                    "$count",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Offstage(
                                  offstage: count == 0 ? false : true,
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                        onTap: () {
                          if (count == 0) {
                            setState(() {
                              isMissingAdv = true;
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ));
    }
  }
}
