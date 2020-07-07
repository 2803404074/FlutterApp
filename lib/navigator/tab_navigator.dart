import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home_page.dart';
import 'package:flutterapp/pages/my_page.dart';
import 'package:flutterapp/pages/home_type_page.dart';
import 'package:flutterapp/pages/game_page.dart';
import 'package:flutterapp/pages/tuig_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.red;
  int _currentIndex = 0;

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          HomeTypePage(),
          GamePage(),
          TuigPage(),
          MyPage()
        ],
        physics: NeverScrollableScrollPhysics(), //禁止滑动
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: _activeColor,
                ),
                title: Text(
                  '首页',
                  style: TextStyle(
                      color: _currentIndex != 0 ? _defaultColor : _activeColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.merge_type,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.merge_type,
                  color: _activeColor,
                ),
                title: Text(
                  '分类',
                  style: TextStyle(
                      color: _currentIndex != 1 ? _defaultColor : _activeColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.games,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.games,
                  color: _activeColor,
                ),
                title: Text(
                  '游戏',
                  style: TextStyle(
                      color: _currentIndex != 2 ? _defaultColor : _activeColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.extension,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.extension,
                  color: _activeColor,
                ),
                title: Text(
                  '推广',
                  style: TextStyle(
                      color: _currentIndex != 3 ? _defaultColor : _activeColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.account_circle,
                  color: _activeColor,
                ),
                title: Text(
                  '我的',
                  style: TextStyle(
                      color: _currentIndex != 4 ? _defaultColor : _activeColor),
                ))
          ]),
    );
  }
}
