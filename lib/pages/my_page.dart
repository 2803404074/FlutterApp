import 'package:flutter/material.dart';
import 'package:flutterapp/pages/collection_page.dart';
import 'package:flutterapp/pages/extension_page.dart';
import 'package:flutterapp/pages/history_page.dart';
import 'package:flutterapp/user/login_page.dart';
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.only(top: height),
            sliver: SliverList(
                delegate: SliverChildListDelegate(<Widget>[
// 头像区域布局
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      child: ClipOval(
                        child: Image.asset(
                          'images/test.png',
                          width: 70,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      },
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '登录/注册',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              Text('观影次数:100/100')
                            ],
                          ),
                        )),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        color: Colors.yellow,
                        child: Text('推广人数 8'),
                      ),
                    )
                  ],
                ),
              ),

              //等级推广
              Container(
                margin: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Container(
                    color: Colors.yellow,
                    height: 80,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Image.asset(
                            'images/test.png',
                            width: 50,
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '当前LV5.超凡大师',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                Text('距离下一个等级还差 0',
                                    textAlign: TextAlign.center),
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              color: Colors.red,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ExtensionPage();
                                  }));
                                },
                                child: Text('立即推广',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              //观看历史
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 3, 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      '观看历史',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: Text(''),
                      flex: 1,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HistoryPage();
                        }));
                      },
                      child: IconText(
                        '全部',
                        direction: Axis.horizontal,
                        position: 0,
                        padding: EdgeInsets.all(2),
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff7A7A7A)),
                        icon: Icon(
                          Icons.navigate_next,
                          color: Color(0xff7A7A7A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, ids) {
                      return Column(
                        children: <Widget>[
                          Container(
                            width: 150,
                            height: 100,
                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2307511656,3386189028&fm=26&gp=0.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            child: Text(
                              '酒店偷拍 经验丰酒店偷拍 经验丰酒店偷拍 经验丰',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          )
                        ],
                      );
                    }),
              ),

              //视频缓存
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 3, 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      '离线缓存',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: Text(''),
                      flex: 1,
                    ),
                    IconText(
                      '1个缓存视频',
                      direction: Axis.horizontal,
                      position: 0,
                      padding: EdgeInsets.all(2),
                      style: TextStyle(fontSize: 15, color: Color(0xff7A7A7A)),
                      icon: Icon(
                        Icons.navigate_next,
                        color: Color(0xff7A7A7A),
                      ),
                    )
                  ],
                ),
              ),

              //分割线
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                height: 15,
                color: Color(0xffF5F5F5),
              ),

              //我的收藏
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CollectionPage();
                  }));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'images/collection.png',
                        width: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text('我的收藏'),
                      ),
                      Expanded(
                        child: Text(''),
                        flex: 1,
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Color(0xff7A7A7A),
                      )
                    ],
                  ),
                ),
              ),

              //小分割线
              Container(
                margin: EdgeInsets.all(10),
                height: 1,
                color: Color(0xfff5f5f5),
              ),

              //意见反馈
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'images/collection.png',
                      width: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text('意见反馈'),
                    ),
                    Expanded(
                      child: Text(''),
                      flex: 1,
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: Color(0xff7A7A7A),
                    )
                  ],
                ),
              ),
              //小分割线
              Container(
                margin: EdgeInsets.all(10),
                height: 1,
                color: Color(0xfff5f5f5),
              ),

              //退出登录
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'images/collection.png',
                      width: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text('退出登录'),
                    ),
                    Expanded(
                      child: Text(''),
                      flex: 1,
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: Color(0xff7A7A7A),
                    )
                  ],
                ),
              ),
              //小分割线
              Container(
                margin: EdgeInsets.all(10),
                height: 1,
                color: Color(0xfff5f5f5),
              )
            ])),
          )
        ]);
  }

  @override
  bool get wantKeepAlive => true;
}
