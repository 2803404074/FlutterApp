import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/main_helpe.dart';
import 'package:flutterapp/widget/GradientButton.dart';

import 'http/ImageDownHttp.dart';
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
    this.base64Str = baseStr;
    this.initStatus = initStatus;
  }
  @override
  _MyAppPageState createState() =>
      _MyAppPageState(this.base64Str, this.initStatus);
}

class _MyAppPageState extends State<MyApp> {
  _MyAppPageState(String base64Str, bool initStatus) {
    this.base64Str = base64Str;
    this.initStatus = initStatus;
  }
  bool initStatus;
  var base64Str = '';
  var seconds = 5;
  Timer countdownTimer;

  bool isMissingAdv = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (countdownTimer != null) {
      countdownTimer.cancel();
      countdownTimer = null;
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
    if (initStatus) {
      countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          if (seconds > 0) {
            seconds--;
          } else {
            if (countdownTimer != null) {
              countdownTimer.cancel();
              countdownTimer = null;
            }
          }
        });
      });

      return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: !initStatus
            ? showErrMessage(context)
            : Stack(
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
                                  child: Image.memory(
                                    base64.decode(this.base64Str),
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    gaplessPlayback: true,
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
                                      offstage: seconds == 0 ? true : false,
                                      child: Text(
                                        "$seconds",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                    Offstage(
                                      offstage: seconds == 0 ? false : true,
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                            onTap: () {
                              if (seconds == 0) {
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
              ),
      );
    } else {
      //弹窗
      return showErrMessage(context);
    }
  }
}
