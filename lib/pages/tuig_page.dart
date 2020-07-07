import 'package:flutter/material.dart';
import 'package:flutterapp/http/CMApi.dart';
import 'package:flutterapp/http/CMMethod.dart';
import 'package:flutterapp/http/DioManager.dart';

class TuigPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TuigPageState();
}

class _TuigPageState extends State<TuigPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    // DioManager().request<MyType>(CMMethod.POST, CMApi.loginPath,
    //     params: {"": ""}, success: (data) {}, error: (error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('推广'),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}

class MyType {
  int name;
  String size;
}
