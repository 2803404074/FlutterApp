import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/pages/collection_page.dart';
import 'package:flutterapp/pages/extension_page.dart';
import 'package:flutterapp/pages/feedback_page.dart';
import 'package:flutterapp/pages/history_page.dart';
import 'package:flutterapp/pages/player/video_player_pager.dart';
import 'package:flutterapp/user/login_page.dart';
import 'package:flutterapp/widget/GradientButton.dart';
import 'dart:ui';

import 'package:flutterapp/widget/IconText.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  var height;
  @override
  void initState() {
    height = new MediaQueryData.fromWindow(window).padding.top;
    super.initState();
  }

  Widget content;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    if (content == null) {
      print('我的build');
      content = ListView.builder(
        itemCount: 12,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext contextx, int index) {
          Widget item;
          switch (index) {
            case 0:
              item = headView(context);
              break;
            case 1:
              item = extensionView(context);
              break;
            case 2:
              item = standerTitle('观看历史', '全部');
              break;
            case 3:
              item = hisitoryListView;
              break;
            case 4:
              item = standerTitle('离线缓存', '1个缓存视频');
              break;
            case 5:
              item = bigLin(ScreenUtil().setHeight(20), 0);
              break;
            case 6:
              item = functionView('我的收藏', 'images/collection@2x.png');
              break;
            case 7:
              item =
                  bigLin(ScreenUtil().setHeight(2), ScreenUtil().setWidth(30));
              break;
            case 8:
              item = functionView('意见反馈', 'images/feedBack@2x.png');
              break;
            case 9:
              item = bigLin(ScreenUtil().setHeight(20), 0);
              break;
            case 10:
              item = functionView('退出登录', 'images/logout@2x.png');
              break;
            case 11:
              item = bigLin(ScreenUtil().setHeight(20), 0);
              break;
          }
          return item;
        },
      );
    } else {
      print('我的缓存页');
    }
    return content;
  }

  //头像区域
  Widget headView(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(30), ScreenUtil().setHeight(46), 0, 0),
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: ClipOval(
              child: Image.asset(
                'images/test.png',
                width: ScreenUtil().setWidth(120),
                height: ScreenUtil().setHeight(120),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginPage();
              }));
            },
          ),
          Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(21)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '登录/注册',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          color: Colors.black),
                    ),
                    Text(
                      '观影次数:100/100',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(26),
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    )
                  ],
                ),
              )),
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              color: Color(0x08FF2825),
              child: Text(
                '推广人数 8',
                style: TextStyle(color: Color(0xffFF2825)),
              ),
            ),
          )
        ],
      ),
    );
  }

  //等级区域
  Widget extensionView(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(30),
        right: ScreenUtil().setWidth(30),
        top: ScreenUtil().setWidth(42),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Container(
          height: ScreenUtil().setHeight(160),
          color: Color(0x0DFF2825),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(34)),
                child: Image.asset(
                  'images/test.png',
                  width: ScreenUtil().setWidth(97),
                  height: ScreenUtil().setHeight(92),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(44)),
                      child: Text(
                        '当前LV5.超凡大师',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(30),
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(22)),
                      child: Text(
                        '距离下一个等级还差 0',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            color: Color.fromRGBO(102, 102, 102, 1)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(80)),
                child: GradientButton(
                  child: Text(
                    '推广升级',
                    style: TextStyle(fontSize: ScreenUtil().setSp(26)),
                    textAlign: TextAlign.center,
                  ),
                  height: ScreenUtil().setHeight(60),
                  width: ScreenUtil().setWidth(174),
                  colors: [Color(0xffFF5B59), Color(0xffFF2825)],
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ExtensionPage();
                    }));
                  },
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//标题组件
  Widget standerTitle(String title, String subTitle) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        ScreenUtil().setWidth(30),
        ScreenUtil().setWidth(40),
        ScreenUtil().setWidth(30),
        ScreenUtil().setWidth(34),
      ),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(28),
                fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(''),
            flex: 1,
          ),
          IconText(
            subTitle,
            direction: Axis.horizontal,
            position: 0,
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
            style: TextStyle(
                fontSize: ScreenUtil().setSp(26),
                color: Color.fromRGBO(102, 102, 102, 1)),
            icon: Icon(
              Icons.navigate_next,
              color: Color(0xff7A7A7A),
            ),
          ),
        ],
      ),
    );
  }

  //历史列表
  Widget hisitoryListView = Container(
    height: ScreenUtil().setHeight(230),
    margin: EdgeInsets.fromLTRB(
        ScreenUtil().setWidth(30), 0, ScreenUtil().setWidth(30), 0),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, ids) {
        return Column(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(246),
              height: ScreenUtil().setHeight(140),
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(16)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(4)),
                child: Image.network(
                  'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2307511656,3386189028&fm=26&gp=0.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(16)),
              width: ScreenUtil().setWidth(246),
              child: Text(
                '酒店偷拍 经验丰酒店偷拍 经验丰酒店偷拍 经验丰',
                style: TextStyle(
                    color: Color(0xff333333), fontSize: ScreenUtil().setSp(24)),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.left,
              ),
            )
          ],
        );
      },
    ),
  );

  //功能组件
  Widget functionView(String title, String imgAsst) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(30),
          ScreenUtil().setHeight(30),
          ScreenUtil().setWidth(30),
          ScreenUtil().setHeight(30)),
      child: Row(
        children: <Widget>[
          Image.asset(
            imgAsst,
            width: ScreenUtil().setWidth(35),
            height: ScreenUtil().setHeight(37),
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            child: Text(title),
          ),
          Expanded(
            child: Text(''),
            flex: 1,
          ),
          Icon(
            Icons.navigate_next,
            size: ScreenUtil().setWidth(28),
            color: Color(0xff7A7A7A),
          )
        ],
      ),
    );
  }

//分割线
  Widget bigLin(double mHeight, double mainginLeftRight) {
    return Container(
      margin: EdgeInsets.only(left: mainginLeftRight, right: mainginLeftRight),
      width: double.infinity,
      height: mHeight,
      color: Color(0xffF5F5F5),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
