import 'dart:convert';

import 'package:flutter/material.dart';
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
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 320,
            child: GridView.builder(
                itemCount: mData.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //横轴元素个数
                    crossAxisCount: 2,
                    //纵轴间距
                    mainAxisSpacing: 20.0,
                    //横轴间距
                    crossAxisSpacing: 10.0,
                    //子组件宽高长度比例
                    childAspectRatio: 1.3),
                itemBuilder: (BuildContext context, int index) {
                  return getItemContainer(index);
                }),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/home_more.png',
                      width: 20,
                      fit: BoxFit.cover,
                    ),
                    Text(' '),
                    Text(
                      '更多',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    )
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
              url: 'http://video-qn.ibaotu.com/18/04/11/45p888piCB4r.mp4');
        }));
      },
      child: Container(
        width: 100,
        height: 100,
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
