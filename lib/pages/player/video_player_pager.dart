import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutterapp/widget/CustomFijkWidgetBottom.dart';
import 'package:flutterapp/widget/GradientButton.dart';
import 'package:flutterapp/widget/IconText.dart';
import 'package:flutterapp/widget/tagView.dart';

class VideoPlayerPage extends StatefulWidget {
  final String url;

  VideoPlayerPage({@required this.url});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  //顶部panding
  var topHeight;

  FijkPlayer player;

  _VideoPlayerPageState();

  double oldSlider;
  @override
  void initState() {
    super.initState();
    topHeight = new MediaQueryData.fromWindow(window).padding.top;
    player = FijkPlayer();
    player.setOption(FijkOption.formatCategory, "headers",
        "token:094f4c94d24411ea898966ee0bdf668a");
    player.setDataSource(widget.url, autoPlay: true);
  }

  void onResum() {
    player.start();
    print(
        'onResum---------------------------------------------------------------------------------');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 220,
                margin: EdgeInsets.only(top: topHeight),
                width: MediaQuery.of(context).size.width,
                child: FijkView(
                  player: player,
                  color: Colors.black,
                  cover: AssetImage('images/img_load.jpeg'),
                  width: double.infinity,
                  height: 220,
                  fit: FijkFit.cover,
                  panelBuilder: (FijkPlayer player, FijkData data,
                      BuildContext context, Size viewSize, Rect texturePos) {
                    return CustomFijkWidgetBottom(
                      player: player,
                      buildContext: context,
                      viewSize: viewSize,
                      texturePos: texturePos,
                      onClick: (value) {
                        print('回调啦');
                      },
                      onSlider: (value) {
                        oldSlider = value;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Expanded(
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 20),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return getCardView;
                          case 1:
                            return getCenterView;
                          case 2:
                            return Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                              child: Text(
                                '猜你喜欢',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          case 3:
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                padding: EdgeInsets.only(left: 20, right: 20),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        player.pause();

                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return VideoPlayerPage(
                                              url:
                                                  'http://api.dev.pear.pw/api/app/video_m3u8/index.m3u8?rate=360&license=U2FsdGVkX1%2FNmDuQMpCH%2FN3mPZ0DdDTv%2FuE6lhBAZImYInQAvh7a6h3%2BKIHb4T%2FzA57xZ4O5XbHXddbgXZIqZV4BhoqopAubyjST3hrU8Ww20C2I6bpvS8sOrGn9x3mtvmHElOP%2BqWatg%2F2Rvg2XRA%3D%3D');
                                        })).then((value) => onResum());
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 3),
                                                child: ClipRRect(
                                                  child: Image.network(
                                                    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2307511656,3386189028&fm=26&gp=0.jpg',
                                                    fit: BoxFit.cover,
                                                    height: 120,
                                                    width: 160,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                              Expanded(
                                                  child: Container(
                                                height: 120,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10, right: 10),
                                                      child: Text(
                                                        '酒店偷拍，经验酒店偷拍，经验酒店偷拍，经验酒店偷拍，经验酒店偷拍，经验',
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 5),
                                                      child: Wrap(
                                                        spacing: 8.0,
                                                        runSpacing: 10.0,
                                                        children: getTagChile(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ))
                                            ],
                                          ),
                                          Offstage(
                                            offstage:
                                                index != 10 ? false : true,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, bottom: 5),
                                              child: Divider(
                                                height: 1,
                                              ),
                                            ),
                                          )
                                        ],
                                      ));
                                });
                        }
                      })))
        ],
      ),
    ));
  }

  Widget getCardView = Container(
    margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
    child: GradientButton(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 30),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '剩余播放次数 10 次',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Text(
                      '播放次数不够？点击免费获得更多次数',
                      style: TextStyle(fontSize: 12, color: Color(0xff333333)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Image.asset(
              'images/play_extension.png',
              width: 40,
              height: 40,
            ),
          )
        ],
      ),
      height: 60,
      width: double.infinity,
      colors: [Color(0xffFBD68A), Color(0xffECAD6D)],
      onPressed: () {},
      borderRadius: BorderRadius.all(Radius.circular(35)),
    ),
  );

  Widget getCenterView = Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '酒店偷拍酒店偷拍酒店偷拍酒店偷拍酒店偷拍酒店偷拍酒店偷拍酒店偷拍',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Text('日本/素人 | 2019-11-18'),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 10.0,
          children: getTagChile(),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: IconText(
                      '收藏',
                      direction: Axis.horizontal,
                      position: 3,
                      padding: EdgeInsets.all(2),
                      style: TextStyle(fontSize: 15, color: Color(0xff7A7A7A)),
                      icon: Icon(
                        Icons.star_border,
                        size: 30,
                        color: Color(0xff7A7A7A),
                      ),
                    ),
                  )),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: IconText(
                    '下载',
                    direction: Axis.horizontal,
                    position: 3,
                    padding: EdgeInsets.all(2),
                    style: TextStyle(fontSize: 15, color: Color(0xff7A7A7A)),
                    icon: Icon(
                      Icons.cloud_download,
                      size: 30,
                      color: Color(0xff7A7A7A),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: IconText(
                  '分享',
                  direction: Axis.horizontal,
                  position: 3,
                  padding: EdgeInsets.all(2),
                  style: TextStyle(fontSize: 15, color: Color(0xff7A7A7A)),
                  icon: Icon(
                    Icons.share,
                    size: 30,
                    color: Color(0xff7A7A7A),
                  ),
                ),
              )),
            ],
          ),
        )
      ],
    ),
  );

  @override
  void dispose() {
    super.dispose();
    player.release();
  }
}

List<Widget> getTagChile() {
  List<Widget> a = List();
  for (int i = 0; i < 4; i++) {
    a.add(Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Text('美女',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xff924949),
          )),
      decoration: BoxDecoration(
          color: Color(0xffFEEDED),
          borderRadius: BorderRadius.all(Radius.circular(15))),
    ));
  }
  return a;
}
