import 'package:flutter/material.dart';
import 'package:flutterapp/pages/history_content_page.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
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
    // TODO: implement initState
    super.initState();
    tabTitles = [
      "今天",
      "七天",
      "更早",
    ];
    mController = TabController(
      length: tabTitles.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: _tabBarView(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text("历史"),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              "清空",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        )
      ],
      bottom: PreferredSize(
        child: Expanded(
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            color: Colors.white,
            child: _tabBar(),
          ),
        ),
        preferredSize: const Size.fromHeight(48.0),
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
        isScrollable: true,
        controller: mController,
        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        labelPadding: EdgeInsets.only(left: 50, right: 50),
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
        indicatorPadding: EdgeInsets.all(5),
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
          return HistoryContentPage();
        }).toList());
  }
}
