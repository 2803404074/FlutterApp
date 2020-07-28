import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/http/ImageDownHttp.dart';
import 'package:flutterapp/model/MovieMo.dart';
import 'package:flutterapp/pages/player/video_player_pager.dart';

/**
 * 首页第一选显卡-猜你喜欢列表
 */
class GuessLikeListView extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<GuessLikeListView>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  bool get wantKeepAlive => true;

  ///see AutomaticKeepAliveClientMixin
  List<MovieMo> mData = List();
  void initDate(String url) async {
    // 延时1s执行返回
    Future.delayed(Duration(seconds: 1), () {
      print('执行*********************');
      mData.clear();
      for (int i = 0; i < 4; i++) {
        MovieMo mo = MovieMo();
        mo.imgUrl = url;
        mo.title = '数据$i';

        mo.decodeStr = '';
        mData.add(mo);
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDate(
        'http://image.i438500.com/storage/images/video/thumbnail/936edb5d4c71976cb3a8b96afc9bf9cb.raw!t!70!600.js');
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  String aaa = "猜你喜欢猜你喜欢猜你喜欢猜你喜欢";
  @override
  Widget build(BuildContext context) {
    super.build(context);

    /// see AutomaticKeepAliveClientMixin
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '猜你喜欢',
          textAlign: TextAlign.right,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
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
                  crossAxisSpacing: 10.0,
                  //子组件宽高长度比例
                  childAspectRatio: 1.3),
              itemBuilder: (BuildContext context, int index) {
                return getItemContainer(index);
              }),
        ),
        InkWell(
          splashColor: Color(0x00ffffff),
          onTap: () {
            controller.reset();
            controller.forward();
            initDate(
                'http://image.i438500.com/storage/images/video/thumbnail/d834f6a7f0dc4419c426ea952cf73bb5.raw!t!70!600.js');
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RotationTransition(
                      //将要执行动画的子view
                      child: Image.asset(
                        'images/home_change.png',
                        width: 20,
                        fit: BoxFit.cover,
                      ),
                      //设置动画的旋转中心
                      alignment: Alignment.center,
                      //动画控制器
                      turns: controller,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '换一换',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
                color: Color(0x80DCDCDC),
                height: 38,
              ),
            ),
          ),
        ),
      ],
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
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
            ),
            Text(
              aaa,
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
