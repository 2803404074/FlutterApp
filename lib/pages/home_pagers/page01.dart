import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp/http/ImageDownHttp.dart';
import 'package:flutterapp/model/MovieMo.dart';
import 'package:flutterapp/model/MovieMoList.dart';
import 'package:flutterapp/pages/classtype/type_page.dart';
import 'package:flutterapp/pages/home_pagers/page1widget/guessLikeListView.dart';
import 'package:flutterapp/pages/home_pagers/page1widget/recommentListView.dart';
import 'package:flutterapp/pages/home_pagers/page1widget/typeListView.dart';
import 'package:flutterapp/pages/player/video_player_pager.dart';
import 'package:flutterapp/util/EventBus.dart';

class Page01 extends StatefulWidget {
  @override
  _Pages01State createState() => _Pages01State();
}

class _Pages01State extends State<Page01> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<Widget> bannerWidget = List();

  ///see AutomaticKeepAliveClientMixin
  //广告位图
  Widget advWidget;

  List<MovieMoList> mTypeData = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int index = 0; index < 4; index++) {
      bannerWidget.add(null);
    }

    for (int index = 0; index < 5; index++) {
      MovieMoList mo = MovieMoList();
      mo.title = '中国';
      List<MovieMo> moList = List();
      for (int j = 0; j < 4; j++) {
        MovieMo mo2 = MovieMo();
        mo2.imgUrl =
            'http://image.i438500.com/storage/images/video/thumbnail/d834f6a7f0dc4419c426ea952cf73bb5.raw!t!70!600.js';
        mo2.title = '酒店偷拍 经验丰富男子白领开放....';
        moList.add(mo2);
      }
      mo.list = moList;
      mTypeData.add(mo);
    }
  }

  EasyRefreshController _controller = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (advWidget == null) {
      ImageDownHttp.getInstance().startDownLoad(
          'http://image.i438500.com/storage/images/video/thumbnail/d834f6a7f0dc4419c426ea952cf73bb5.raw!t!70!600.js',
          (values, status) {
        setState(() {
          advWidget = Image.memory(
            base64.decode(values),
            height: ScreenUtil().setWidth(190),
            width: double.infinity,
            fit: BoxFit.cover,
            gaplessPlayback: true,
          );
        });
      });
    }

    /// see AutomaticKeepAliveClientMixin
    // TODO: implement build

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      cacheExtent: 3000,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            {
              return Stack(
                children: <Widget>[
                  Container(
                    height: 80,
                    margin: EdgeInsets.only(top: 0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color(0xffFF2825),
                      Color(0xffFF5B59),
                    ])),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3, bottom: 10),
                    height: ScreenUtil().setHeight(320),
                    child: Swiper(
                      itemCount: 4,
                      itemBuilder: _swiperBuilder,
                      pagination: SwiperPagination(
                          alignment: Alignment.bottomRight,
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                          builder: DotSwiperPaginationBuilder(
                              color: Color(0x80ffffff),
                              activeColor: Colors.red)),
                      controller: SwiperController(),
                      scrollDirection: Axis.horizontal,
                      autoplay: true,
                      onTap: (index) => print('点击了第$index'),
                    ),
                  ),
                ],
              );
            }
          case 1:
            {
              return Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(40),
                    bottom: ScreenUtil().setHeight(39)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                            child: Column(
                              children: <Widget>[
                                FadeInImage.assetNetwork(
                                  placeholder: "images/img_load.jpeg",
                                  image:
                                      'http://p9.pccoo.cn/weixin/20171113/2017111316565418467518_1080_1080.jpg',
                                  height: ScreenUtil().setHeight(100),
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: Text(
                                    '无码素人',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(24)),
                                  ),
                                )
                              ],
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return TypePage();
                              }));
                            })),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                            child: Column(
                              children: <Widget>[
                                FadeInImage.assetNetwork(
                                  placeholder: "images/img_load.jpeg",
                                  image:
                                      'http://ku.90sjimg.com/element_origin_min_pic/00/86/24/3156eade908f1d1.jpg',
                                  height: ScreenUtil().setHeight(100),
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: Text(
                                    '国产自拍',
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(24),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return TypePage();
                              }));
                            })),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                            child: Column(
                              children: <Widget>[
                                FadeInImage.assetNetwork(
                                  placeholder: "images/img_load.jpeg",
                                  image:
                                      'http://e0.ifengimg.com/05/2019/0227/4FF08CBB201C96B45205D381BC106BFE537F4BFE_size19_w300_h300.png',
                                  height: ScreenUtil().setHeight(100),
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: Text(
                                    '人气淑女',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(24)),
                                  ),
                                )
                              ],
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return TypePage();
                              }));
                            })),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                            child: Column(
                              children: <Widget>[
                                FadeInImage.assetNetwork(
                                  placeholder: "images/img_load.jpeg",
                                  image:
                                      'http://bpic.588ku.com/element_origin_min_pic/17/08/10/3e9752eebe792b296e7c77d860ad8484.jpg%21/fwfh/804x804/quality/90/unsharp/true/compress/true',
                                  height: ScreenUtil().setHeight(100),
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: Text(
                                    '角色扮演',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(24)),
                                  ),
                                )
                              ],
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return TypePage();
                              }));
                            }))
                  ],
                ),
              );
            }
          case 2:
            {
              return Container(
                margin: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(20),
                    ScreenUtil().setHeight(0),
                    ScreenUtil().setWidth(20),
                    ScreenUtil().setHeight(0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: advWidget == null
                      ? SizedBox(
                          height: ScreenUtil().setWidth(190),
                        )
                      : advWidget,
                ),
              );
            }
          case 3:
            {
              return Container(
                margin: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(20),
                    ScreenUtil().setHeight(50),
                    ScreenUtil().setWidth(20),
                    ScreenUtil().setHeight(50)),
                child: RecommentListView(),
              );
            }
          case 4:
            {
              return Container(
                margin: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(20),
                    ScreenUtil().setHeight(0),
                    ScreenUtil().setWidth(20),
                    ScreenUtil().setHeight(50)),
                child: GuessLikeListView(),
              );
            }
          case 5:
            {
              return Container(
                margin: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(20),
                    ScreenUtil().setHeight(0),
                    ScreenUtil().setWidth(20),
                    ScreenUtil().setHeight(50)),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: mTypeData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                mTypeData[index].title,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: ScreenUtil().setSp(32)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return VideoPlayerPage(
                                        url:
                                            'http://api.dev.pear.pw/api/app/video_m3u8/index.m3u8?rate=360&license=U2FsdGVkX1%2FNmDuQMpCH%2FN3mPZ0DdDTv%2FuE6lhBAZImYInQAvh7a6h3%2BKIHb4T%2FzA57xZ4O5XbHXddbgXZIqZV4BhoqopAubyjST3hrU8Ww20C2I6bpvS8sOrGn9x3mtvmHElOP%2BqWatg%2F2Rvg2XRA%3D%3D');
                                  }));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: ScreenUtil().setHeight(39)),
                                  height: ScreenUtil().setHeight(464),
                                  child: judge(index)
                                      ? getTypeListFirstImage(index)
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.memory(
                                            base64.decode(mTypeData[index]
                                                .list[0]
                                                .decodeStr),
                                            height: 200,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            gaplessPlayback: true,
                                          ),
                                        ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(16),
                              ),
                              Text(
                                mTypeData[index].list[0].title,
                                textAlign: TextAlign.start,
                              ),
                              TypeListView(mTypeData[index].list),
                            ]),
                      );
                    }),
              );
            }
        }
      },
    );
  }

  bool judge(int index) {
    print('继续执行');
    return mTypeData[index].list[0].decodeStr == null;
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    // return (imageList[index]);
    if (bannerWidget[index] != null) {
      print(
          '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
      return bannerWidget[index];
    } else {
      print(
          '-------------------------------------------------------------------');
      ImageDownHttp.getInstance().startDownLoad(
          'http://image.i438500.com/storage/images/video/thumbnail/d834f6a7f0dc4419c426ea952cf73bb5.raw!t!70!600.js',
          (values, status) {
        bannerWidget[index] = Container(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(20),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.memory(
                base64.decode(values),
                height: ScreenUtil().setHeight(320),
                width: double.infinity,
                fit: BoxFit.cover,
                gaplessPlayback: true,
              )),
        );
        setState(() {});
      });
      return Container(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: ScreenUtil().setHeight(320),
            )),
      );
    }
  }

  Widget getItemContainer(String item) {
    return Container(
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
              child: Image.network(
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2307511656,3386189028&fm=26&gp=0.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            '数据数',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
      ),
    );
  }

  Widget getTypeListFirstImage(int index) {
    var a = mTypeData[index].list;
    print('获取长度--------------------------------${a[0].imgUrl}');
    ImageDownHttp.getInstance().startDownLoad(mTypeData[index].list[0].imgUrl,
        (values, status) {
      setState(() {
        mTypeData[index].list[0].decodeStr = values;
      });
    });

    return SizedBox();
  }
}
