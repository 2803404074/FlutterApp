import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/http/ImageDownHttp.dart';
import 'package:flutterapp/model/MovieMo.dart';
import 'package:flutterapp/model/MovieMoList.dart';
import 'package:flutterapp/pages/player/video_player_pager.dart';
/**
 * 首页-其他视频列表
 */

class TypeListView extends StatefulWidget {
  List<MovieMo> mData;
  int index;
  TypeListView(List<MovieMo> mData) {
    this.mData = mData;
  }
  @override
  _PagesState createState() => _PagesState(this.mData);
}

class _PagesState extends State<TypeListView>
    with AutomaticKeepAliveClientMixin {
  List<MovieMo> mData;
  _PagesState(List<MovieMo> mData) {
    this.mData = mData;
  }
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    /// see AutomaticKeepAliveClientMixin
    // TODO: implement build
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: GridView.builder(
                itemCount: mData.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                  crossAxisCount: 2,
                  //纵轴间距
                  mainAxisSpacing: 20.0,
                  //横轴间距
                  crossAxisSpacing: ScreenUtil().setWidth(20),
                  //子组件宽高长度比例
                  //childAspectRatio: 1.3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return getItemContainer(index);
                }),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                30, ScreenUtil().setHeight(40), 30, ScreenUtil().setHeight(50)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/home_more.png',
                      width: ScreenUtil().setWidth(27),
                      height: ScreenUtil().setHeight(26),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(12),
                    ),
                    Text(
                      '更多',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: ScreenUtil().setSp(24)),
                    ),
                  ],
                ),
                color: Color(0x80DCDCDC),
                height: 38,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getItemContainer(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return VideoPlayerPage(
              url:
                  'http://api.dev.pear.pw/api/app/video_m3u8/index.m3u8?rate=360&license=U2FsdGVkX1%2FMCJMbgToMum3O00Z3nqmF10HSknltQz7%2FfSuqUVsxD7HTGRzZhEhRX2TgjopOkLap0HgsM33zgPGc3lFomGuDvPJ5hwrafzIm7OuMnz0omRK%2BieVAxVh%2Fd0ynBdFc6Hu6kCQObdb2qw%3D%3D');
        }));
      },
      child: Container(
        width: ScreenUtil().setWidth(335),
        height: ScreenUtil().setHeight(300),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: mData[index].decodeStr != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.memory(
                        base64.decode(mData[index].decodeStr),
                        height: ScreenUtil().setWidth(225),
                        width: double.infinity,
                        fit: BoxFit.cover,
                        gaplessPlayback: true,
                      ))
                  : getImg(index),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(16),
            ),
            Text(
              '数据数',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: ScreenUtil().setSp(24)),
              maxLines: 2,
            )
          ],
        ),
      ),
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
