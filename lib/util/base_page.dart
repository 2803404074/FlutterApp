import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home_pagers/page01.dart';
import 'package:flutterapp/pages/home_pagers/page02.dart';

import 'package:flutterapp/search/SearchBarDelegate.dart';

abstract class BasePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => getState();

  BaseWidgetState getState();
}

abstract class BaseWidgetState<T extends BasePage> extends State<T>
    with AutomaticKeepAliveClientMixin {
  @override
  // 保存页面存活
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return _getBasevIEW(context);
  }

  Widget _getBasevIEW(BuildContext context) {
    return Container(
      child: buildWidget(context),
    );
  }

  Widget buildWidget(BuildContext context) {}
}
