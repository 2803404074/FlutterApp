import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/http/ImageDownHttp.dart';
import 'package:flutterapp/model/MovieMo.dart';
import 'package:flutterapp/pages/player/video_player_pager.dart';

/**
 * 首页第一选显卡-推荐列表
 */
class RecommentListView extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<RecommentListView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<MovieMo> mData = List();

  ///see AutomaticKeepAliveClientMixin

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDate();
  }

  void initDate() async {
    // 延时1s执行返回
    Future.delayed(Duration(seconds: 6), () {
      print('执行*********************');
      for (int i = 0; i < 10; i++) {
        MovieMo mo = MovieMo();
        mo.title = '数据$i';
        mo.imgUrl =
            'http://image.i438500.com/storage/images/video/thumbnail/d834f6a7f0dc4419c426ea952cf73bb5.raw!t!70!600.js';
        mo.decodeStr = '';
        mData.add(mo);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    /// see AutomaticKeepAliveClientMixin
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '热门推荐',
          textAlign: TextAlign.right,
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: ScreenUtil().setSp(32)),
        ),
        Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(39)),
          height: ScreenUtil().setHeight(253),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: mData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return VideoPlayerPage(
                          url:
                              'http://api.dev.pear.pw/api/app/video_m3u8/index.m3u8?rate=360&license=U2FsdGVkX1%2FMCJMbgToMum3O00Z3nqmF10HSknltQz7%2FfSuqUVsxD7HTGRzZhEhRX2TgjopOkLap0HgsM33zgPGc3lFomGuDvPJ5hwrafzIm7OuMnz0omRK%2BieVAxVh%2Fd0ynBdFc6Hu6kCQObdb2qw%3D%3D');
                    }));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: ScreenUtil().setWidth(268),
                        height: ScreenUtil().setHeight(180),
                        margin: EdgeInsets.fromLTRB(
                            0, 0, 10, ScreenUtil().setHeight(16)),
                        child: mData[index].decodeStr != ''
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.memory(
                                  base64.decode(mData[index].decodeStr),
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  gaplessPlayback: true,
                                ))
                            : getImg(index),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(268),
                        height: ScreenUtil().setHeight(57),
                        child: Text(
                          '推荐推荐推荐推荐推荐推荐推荐推荐推荐推荐推荐推荐',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: ScreenUtil().setSp(24)),
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget getImg(int index) {
    ImageDownHttp.getInstance().startDownLoad(mData[index].imgUrl,
        (values, status) {
      setState(() {
        mData[index].decodeStr = values;
      });
    });
    return SizedBox();
  }
}
