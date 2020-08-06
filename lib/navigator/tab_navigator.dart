import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/pages/home_page.dart';
import 'package:flutterapp/pages/my_page.dart';
import 'package:flutterapp/pages/home_type_page.dart';
import 'package:flutterapp/pages/game_page.dart';
import 'package:flutterapp/pages/tuig_page.dart';
import 'package:flutterapp/util/EventBus.dart';

class TabNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  List<Widget> pages = List();
  var _currentIndex = 0;

  // final PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages
      ..add(HomePage())
      ..add(HomeTypePage())
      ..add(GamePage())
      ..add(TuigPage())
      ..add(MyPage());
  }

  int size;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('tab rebuild');
    size = 55;
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            //_controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          selectedFontSize: ScreenUtil().setSp(23),
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'images/nav_home_h.png',
                  width: ScreenUtil().setWidth(size),
                  height: ScreenUtil().setHeight(size),
                ),
                activeIcon: Image.asset(
                  'images/nav_home.png',
                  width: ScreenUtil().setWidth(size),
                  height: ScreenUtil().setHeight(size),
                ),
                title: Text(
                  '首页',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: _currentIndex != 0 ? Colors.grey : Colors.red),
                )),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'images/nav_type_h.png',
                  width: ScreenUtil().setWidth(size),
                  height: ScreenUtil().setHeight(size),
                ),
                activeIcon: Image.asset(
                  'images/nav_type.png',
                  width: ScreenUtil().setWidth(size),
                  height: ScreenUtil().setHeight(size),
                ),
                title: Text(
                  '分类',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: _currentIndex != 1 ? Colors.grey : Colors.red),
                )),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'images/nav_game_h.png',
                  width: ScreenUtil().setWidth(size),
                  height: ScreenUtil().setHeight(size),
                ),
                activeIcon: Image.asset(
                  'images/nav_game.png',
                  width: ScreenUtil().setWidth(size),
                  height: ScreenUtil().setHeight(size),
                ),
                title: Text(
                  '游戏',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: _currentIndex != 2 ? Colors.grey : Colors.red),
                )),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'images/nav_extension_h.png',
                  width: ScreenUtil().setWidth(size),
                  height: ScreenUtil().setHeight(size),
                ),
                activeIcon: Image.asset(
                  'images/nav_extension.png',
                  width: ScreenUtil().setWidth(size),
                  height: ScreenUtil().setHeight(size),
                ),
                title: Text(
                  '推广',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: _currentIndex != 3 ? Colors.grey : Colors.red),
                )),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'images/nav_person_h.png',
                  width: ScreenUtil().setWidth(size),
                  height: ScreenUtil().setHeight(size),
                ),
                activeIcon: Image.asset(
                  'images/nav_person.png',
                  width: ScreenUtil().setWidth(size),
                  height: ScreenUtil().setHeight(size),
                ),
                title: Text(
                  '我的',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: _currentIndex != 4 ? Colors.grey : Colors.red),
                ))
          ]),
    );
  }
}
