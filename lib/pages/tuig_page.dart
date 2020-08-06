import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            padding: EdgeInsets.fromLTRB(ScreenUtil().setHeight(30), 0,
                ScreenUtil().setHeight(30), ScreenUtil().setHeight(45)),
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                width: double.infinity,
                height: ScreenUtil().setHeight(388),
                color: Colors.white,
                // 二维码区域
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 0, right: 0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "images/img_load.jpeg",
                                fit: BoxFit.cover,
                                width: ScreenUtil().setWidth(191),
                                height: ScreenUtil().setHeight(191),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "LYSMUS",
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(56),
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(22),
                                ),
                                child: Text(
                                  "你的推广码",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(26),
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(22)),
                                width: ScreenUtil().setWidth(60),
                                height: ScreenUtil().setHeight(2),
                                color: Colors.black,
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                    // 虚线
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(30),
                        bottom: ScreenUtil().setHeight(20),
                      ),
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
                              margin: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(30),
                                  right: ScreenUtil().setWidth(15)),
                              height: ScreenUtil().setHeight(78),
                              width: ScreenUtil().setWidth(300),
                              child: Image.asset(
                                'images/saveewm.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: ScreenUtil().setHeight(78),
                              width: ScreenUtil().setWidth(300),
                              margin: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(15),
                                  right: ScreenUtil().setWidth(30)),
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
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: ScreenUtil().setSp(28)),
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
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(400)),
            child: Container(
              //transform: Matrix4.identity()..rotateY(90),
              child: Icon(
                Icons.eject,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(468)),
            child: Text(
              '分享好友立即增加观影次数',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(44),
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(48)),
            child: Image.asset(
              'images/extension_top_logo.png',
              width: ScreenUtil().setWidth(233),
              height: ScreenUtil().setHeight(72),
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
