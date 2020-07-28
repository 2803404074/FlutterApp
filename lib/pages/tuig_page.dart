import 'package:flutter/material.dart';
import 'package:flutterapp/http/CMApi.dart';
import 'package:flutterapp/http/CMMethod.dart';
import 'package:flutterapp/http/DioManager.dart';
import 'dart:math' as math;

import 'package:flutterapp/util/dashedLine.dart';

class TuigPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TuigPageState();
}

class _TuigPageState extends State<TuigPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    // DioManager().request<MyType>(CMMethod.POST, CMApi.loginPath,
    //     params: {"": ""}, success: (data) {}, error: (error) {});
  }

  Widget content;
  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (content == null) {
      print('推广build');
      content = Stack(
        children: <Widget>[
          // 背景图片
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "images/generalize.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                width: double.infinity,
                height: 260,
                color: Colors.white,
                // 二维码区域
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "images/img_load.jpeg",
                            fit: BoxFit.cover,
                            width: 120,
                            height: 120,
                          ),
                          Expanded(child: Text('')),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "LYSMUS",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "你的推广码",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // 虚线
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: dashedLine(
                        axis: Axis.horizontal,
                        count: 45,
                        dashedWidth: 5,
                        dashedHeight: 0.5,
                        color: Colors.black,
                      ),
                    ),

                    // 保存二维码,复制推广链接
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.only(right: 10, left: 20),
                              child: RaisedButton(
                                onPressed: () {},
                                elevation: 0,
                                color: Colors.red[300],
                                child: Text(
                                  "保存二维码",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.only(left: 10, right: 20),
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                border:
                                    new Border.all(width: 1, color: Colors.red),
                              ),
                              child: Text(
                                "复制推广链接",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 三角形符号
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 258),
            child: Container(
              //transform: Matrix4.identity()..rotateY(90),
              child: Icon(
                Icons.eject,
                size: 40,
                color: Colors.white,
              ),
            ),
          )
        ],
      );
    } else {
      print('推广缓存页');
    }
    return content;
  }

  @override
  bool get wantKeepAlive => true;
}
