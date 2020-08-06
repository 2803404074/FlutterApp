import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  List<Widget> pages = List();

  List<NavItemMo> navItemMoList = List();

  var _currentIndex = 0;

  // final PageController _controller = PageController(initialPage: 0);

  bool one = false;
  bool tow = false;
  bool three = false;
  bool four = false;
  bool five = false;

  //是否需要广告页期间加载基本功能页面，首页、分类、游戏、推广、我的
  bool isNeedAllLoad = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (isNeedAllLoad) {
      pages
        ..add(HomePage())
        ..add(HomeTypePage())
        ..add(GamePage())
        ..add(TuigPage())
        ..add(MyPage());
    } else {
      pages
        ..add(Text(''))
        ..add(Text(''))
        ..add(Text(''))
        ..add(Text(''))
        ..add(Text(''));
    }

    navItemMoList
      ..add(NavItemMo('首页', 'images/nav_home.png', 'images/nav_home_h.png'))
      ..add(NavItemMo('分类', 'images/nav_type.png', 'images/nav_type_h.png'))
      ..add(NavItemMo('游戏', 'images/nav_game.png', 'images/nav_game_h.png'))
      ..add(NavItemMo(
          '推广', 'images/nav_extension.png', 'images/nav_extension_h.png'))
      ..add(
          NavItemMo('我的', 'images/nav_person.png', 'images/nav_person_h.png'));
  }

  int size;

  void setPageVisible() {
    switch (_currentIndex) {
      case 0:
        if (!one) {
          pages[_currentIndex] = HomePage();
          one = true;
        }
        break;
      case 1:
        if (!tow) {
          pages[_currentIndex] = HomeTypePage();
          tow = true;
        }
        break;
      case 2:
        if (!three) {
          pages[_currentIndex] = GamePage();
          three = true;
        }
        break;
      case 3:
        if (!four) {
          pages[_currentIndex] = TuigPage();
          four = true;
        }
        break;
      case 4:
        if (!five) {
          pages[_currentIndex] = MyPage();
          five = true;
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('tab rebuild');
    size = 55;
    if (!isNeedAllLoad) {
      setPageVisible();
    }

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
          items: getNavigatrionItem()),
    );
  }

  List<BottomNavigationBarItem> getNavigatrionItem() {
    List<BottomNavigationBarItem> barList = List();
    for (int index = 0; index < navItemMoList.length; index++) {
      barList.add(BottomNavigationBarItem(
          icon: Image.asset(
            navItemMoList[index].unSelectIconName,
            width: ScreenUtil().setWidth(size),
            height: ScreenUtil().setHeight(size),
          ),
          activeIcon: Image.asset(
            navItemMoList[index].selectIconName,
            width: ScreenUtil().setWidth(size),
            height: ScreenUtil().setHeight(size),
          ),
          title: Text(
            navItemMoList[index].title,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                color: _currentIndex != index ? Colors.grey : Colors.red),
          )));
    }

    return barList;
  }
}

class NavItemMo {
  String title;
  String selectIconName;
  String unSelectIconName;
  NavItemMo(String title, String selectIconName, String unSelectIconName) {
    this.title = title;
    this.selectIconName = selectIconName;
    this.unSelectIconName = unSelectIconName;
  }
}
