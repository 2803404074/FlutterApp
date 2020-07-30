import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
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
      for (int i = 0; i < 20; i++) {
        MovieMo mo = MovieMo();
        mo.title = '数据$i';
        mo.imgUrl =
            'http://image.i438500.com/storage/images/video/thumbnail/936edb5d4c71976cb3a8b96afc9bf9cb.raw!t!70!600.js';
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
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 130,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return VideoPlayerPage(
                          url:
                              'http://api.dev.pear.pw/api/app/video_m3u8/index.m3u8?rate=360&license=U2FsdGVkX1%2FNmDuQMpCH%2FN3mPZ0DdDTv%2FuE6lhBAZImYInQAvh7a6h3%2BKIHb4T%2FzA57xZ4O5XbHXddbgXZIqZV4BhoqopAubyjST3hrU8Ww20C2I6bpvS8sOrGn9x3mtvmHElOP%2BqWatg%2F2Rvg2XRA%3D%3D');
                    }));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 100,
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
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
                      Text(
                        '数据数',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
    ImageDownHttp.getInstance().startDownLoad(
        'http://image.i438500.com/storage/images/video/thumbnail/936edb5d4c71976cb3a8b96afc9bf9cb.raw!t!70!600.js',
        (values, status) {
      setState(() {
        mData[index].decodeStr = values;
      });
    });
    return SizedBox();
  }
}
