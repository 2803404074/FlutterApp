import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('tab rebuild');
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
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                title: Text(
                  '首页',
                  style: TextStyle(
                      color: _currentIndex != 0 ? Colors.grey : Colors.red),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.merge_type,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.merge_type,
                  color: Colors.red,
                ),
                title: Text(
                  '分类',
                  style: TextStyle(
                      color: _currentIndex != 1 ? Colors.grey : Colors.red),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.games,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.games,
                  color: Colors.red,
                ),
                title: Text(
                  '游戏',
                  style: TextStyle(
                      color: _currentIndex != 2 ? Colors.grey : Colors.red),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.extension,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.extension,
                  color: Colors.red,
                ),
                title: Text(
                  '推广',
                  style: TextStyle(
                      color: _currentIndex != 3 ? Colors.grey : Colors.red),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.account_circle,
                  color: Colors.red,
                ),
                title: Text(
                  '我的',
                  style: TextStyle(
                      color: _currentIndex != 4 ? Colors.grey : Colors.red),
                ))
          ]),
    );
  }
}
