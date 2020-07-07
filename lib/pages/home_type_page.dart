import 'package:flutter/material.dart';
import 'dart:convert';

class HomeTypePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<HomeTypePage>
    with AutomaticKeepAliveClientMixin {
  Future<int> future;

  @override
  Widget build(BuildContext context) {
    var list = ['亚洲无码', '日本AV', '偷拍自拍', '欧美唯美', '动漫三级', 'AV剧情', '大杂烩'];
    print('进入页面');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            '全部分类',
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, ids) {
                print('渲染第$ids');
                return Stack(
                  children: <Widget>[
                    Container(
                      height: 200,
                      margin: EdgeInsets.only(bottom: 20),
                      width: double.infinity,
                      child: Card(
                        elevation: 10,
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Image.network(
                          'http://01.minipic.eastday.com/20170113/20170113174441_4a700387e67e0119e06a111ee2292bf7_10.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Card(
                        elevation: 0,
                        color: Color(0x00000000),
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(30, 100, 0, 0),
                          decoration: BoxDecoration(color: Color(0x80000000)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${list[ids]}',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Text('介绍介绍介绍介绍介绍介绍介绍介绍',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }),
        ));
  }

  @override
  void initState() {
    future = Future.value(42);
    super.initState();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class CommonModel<T> {
  final int code;
  final T result;
  final String msg;

  CommonModel({this.code, this.result, this.msg});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      code: json['code'],
      result: json['result'],
      msg: json['msg'],
    );
  }
}
