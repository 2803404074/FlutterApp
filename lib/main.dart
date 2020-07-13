import 'dart:async';

import 'package:flutter/material.dart';

import 'navigator/tab_navigator.dart';

/**
 * 启动、广告逻辑
 */
void main() {
  //初始化数据后跳转广告页
  Future.delayed(Duration(seconds: 2), () {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyApp> {
  var seconds = 5;
  Timer countdownTimer;

  bool isMissingAdv = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          isMissingAdv = true;
          countdownTimer.cancel();
          countdownTimer = null;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Stack(
        children: <Widget>[
          TabNavigator(),
          Offstage(
            offstage: isMissingAdv,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: Image.network(
                        'http://img.pconline.com.cn/images/upload/upc/tx/itbbs/1609/30/c48/27767814_1475244403695_1024x1024.jpg',
                        fit: BoxFit.cover,
                      ),
                    )),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Text('$seconds'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
