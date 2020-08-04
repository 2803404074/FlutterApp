import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/pages/history_page.dart';
import 'package:flutterapp/pages/home_pagers/page01.dart';
import 'package:flutterapp/pages/home_pagers/page02.dart';

import 'package:flutterapp/search/SearchBarDelegate.dart';
import 'package:flutterapp/util/EventBus.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController mController;
  List<String> tabTitles;

  @override
  // 保存页面存活
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }

  @override
  void initState() {
    super.initState();
    future = Future.value(42);
    tabTitles = [
      "中国",
      "日本",
      "欧美",
      "韩国",
      "朝鲜",
      "泰国",
      "动漫",
      "东南亚",
      "非洲",
    ];
    mController = TabController(
      length: tabTitles.length,
      vsync: this,
    );
  }

// Text('草莓APP',
//           style: TextStyle(
//               fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red))
  Widget _appBarView() {
    return AppBar(
      titleSpacing: 0.0,
      title: Container(
        margin: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(30), 0, ScreenUtil().setWidth(30), 0),
        child: Row(
          children: <Widget>[
            InkWell(
              child: Image.asset(
                'images/home_logo.png',
                width: ScreenUtil().setWidth(66),
                height: ScreenUtil().setHeight(66),
              ),
              onTap: () {
                print('点击了icon');
              },
            ),
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), 0,
                      ScreenUtil().setWidth(30), 0),
                  height: ScreenUtil().setHeight(66),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().setWidth(43)),
                    child: Container(
                      color: Color(0x4c000000),
                      height: ScreenUtil().setHeight(66),
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                      child: InkWell(
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: SearchBarDelegate(),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              'images/search.png',
                              width: 17,
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(21),
                            ),
                            Text(
                              '想看什么就点我',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(24),
                                  color: Color(0xffFFBCBC)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
            GestureDetector(
              child: Image.asset(
                'images/history.png',
                width: ScreenUtil().setWidth(40),
                height: ScreenUtil().setHeight(40),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HistoryPage();
                }));
              },
            )
          ],
        ),
      ),
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffFF2825),
          Color(0xffFF5B59),
        ])),
      ),
      bottom: _tabBar(),
    );
  }

  Widget _tabBar() {
    return TabBar(
        indicatorPadding: EdgeInsets.all(5),
        isScrollable: true,
        controller: mController,
        labelStyle: TextStyle(
            fontSize: ScreenUtil().setSp(32), fontWeight: FontWeight.bold),
        //设置tab选中得颜色
        labelColor: Colors.white,
        //设置tab未选中得颜色
        unselectedLabelColor: Color(0xa5ffffff),
        //设置自定义tab的指示器，CustomUnderlineTabIndicator
        //若不需要自定义，可直接通过
        //indicatorColor 设置指示器颜色
        //indicatorWight 设置指示器厚度
        //indicatorPadding
        //indicatorSize  设置指示器大小计算方式

        indicatorColor: Colors.yellow,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: tabTitles.map((item) {
          return Tab(text: item);
        }).toList());
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: mController,
      children: tabTitles.map((item) {
        switch (item) {
          case "中国":
            return Page01();
            break;
          default:
            return Page02();
        }
      }).toList(),
    );
  }

  Future<int> future;

  Widget content;
  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (content == null) {
      print('首页build');
      content = Scaffold(
        appBar: _appBarView(),
        body: _tabBarView(),
      );
    } else {
      print('首页缓存页');
    }
    return content;
  }
}
