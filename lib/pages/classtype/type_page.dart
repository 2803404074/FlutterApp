import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapp/pages/classtype/type_page_sun.dart';
import 'package:flutterapp/pages/home_pagers/page01.dart';
import 'package:flutterapp/pages/home_pagers/page02.dart';

import 'package:flutterapp/search/SearchBarDelegate.dart';

class TypePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TypePageState();
}

class _TypePageState extends State<TypePage>
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
    tabTitles = [
      "全部",
      "素人",
      "清纯萝莉",
      "妇女少妇",
      "性感少妇",
      "偷拍",
      "清纯萝莉",
      "性感少妇",
      "素人",
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
        centerTitle: true,
        title: Text(
          '日本',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        leading: Icon(Icons.navigate_before),
        elevation: 0,
        backgroundColor: Colors.red,
        bottom: PreferredSize(
          child: Container(
            padding: EdgeInsets.only(top: 5),
            color: Colors.white,
            child: _tabBar(),
          ),
          preferredSize: const Size.fromHeight(48.0),
        ));
  }

  Widget _tabBar() {
    return TabBar(
        indicatorPadding: EdgeInsets.all(5),
        isScrollable: true,
        controller: mController,
        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        //设置tab选中得颜色
        labelColor: Colors.black,
        //设置tab未选中得颜色
        unselectedLabelColor: Color(0xa5000000),
        //设置自定义tab的指示器，CustomUnderlineTabIndicator
        //若不需要自定义，可直接通过
        //indicatorColor 设置指示器颜色

        //indicatorWight 设置指示器厚度
        //indicatorPadding
        //indicatorSize  设置指示器大小计算方式

        indicatorColor: Color(0xffff6e40),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: tabTitles.map((item) {
          return Tab(text: item);
        }).toList());
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: mController,
      children: tabTitles.map((item) {
        return TypePageSun();
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarView(),
      body: _tabBarView(),
    );
  }
}
