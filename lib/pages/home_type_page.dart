import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutterapp/pages/classtype/type_page.dart';

class HomeTypePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<HomeTypePage>
    with AutomaticKeepAliveClientMixin {
  Future<int> future;
  var list = ['亚洲无码', '日本AV', '偷拍自拍', '欧美唯美', '动漫三级', 'AV剧情', '大杂烩'];

  var listImg = [
    'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2939692531,2718654753&fm=26&gp=0.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1594125580024&di=a2d25045ff04702a384b1e3a8c817baf&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2%2F581da8abb79ea.jpg',
    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3906214032,1279273669&fm=26&gp=0.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1594125727709&di=cfc1dca24829d359c54399c9e1ae1212&imgtype=0&src=http%3A%2F%2F00.minipic.eastday.com%2F20161228%2F20161228145808_b28cca05546947924378c43406487cce_7.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1594125985907&di=49d3f80efaafcfacbfb8a9ab50cbd45b&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%3D580%2Fsign%3Db984b7bef8edab6474724dc8c737af81%2F200bab64034f78f0eabd53867a310a55b2191c73.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1594125851999&di=a2f2017b6a5be6c896a8a9b58a616276&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20171128%2F08157deff4424f409e1736d4cf432ac2.gif',
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3169534223,907257987&fm=26&gp=0.jpg'
  ];
  @override
  Widget build(BuildContext context) {
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TypePage();
                    }));
                  },
                  child: Stack(
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
                            '${listImg[ids]}',
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
                            padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                            decoration: BoxDecoration(color: Color(0x4D000000)),
                            child: _judgeItemType(ids),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ));
  }

  Widget _judgeItemType(int ids) {
    return Column(
      crossAxisAlignment:
          ids % 2 == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          '${list[ids]}',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 2,
        ),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          width: 150,
          child: Text(
            "国内成人视频海量汇聚·精品推荐·越看越爽...",
            maxLines: 2,
            style: TextStyle(
                color: Colors.white54,
                fontSize: 16,
                decoration: TextDecoration.none),
            overflow: TextOverflow.ellipsis,
          ),
        )),
        Expanded(
            child: Wrap(
          spacing: 8.0,
          runSpacing: 10.0,
          children: getChile(),
        ))
      ],
    );
  }

  List<Widget> getChile() {
    print("走。。。。。。。");
    List<Widget> a = List();
    for (int i = 0; i < 4; i++) {
      a.add(Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Text(
          '精品',
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: Color(0x80000000),
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ));
    }
    return a;
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
