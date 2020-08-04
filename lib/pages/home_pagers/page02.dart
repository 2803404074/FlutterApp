import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutterapp/http/ImageDownHttp.dart';
import 'package:flutterapp/pages/player/video_player_pager.dart';

class Page02 extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Page02> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ///see AutomaticKeepAliveClientMixin

  var imgUrl = '';

  List<DemoMo> list = List();

  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      list.add(DemoMo(''));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    /// see AutomaticKeepAliveClientMixin
    // TODO: implement build

    return Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: EasyRefresh(
          header: ClassicalHeader(
            refreshText: '下拉刷新',
            refreshReadyText: '松手刷新',
            refreshedText: '刷新成功',
            refreshingText: '正在加载',
            refreshFailedText: '加载失败',
            textColor: Colors.grey,
            bgColor: Colors.white,
            infoText: '上次刷新 %T',
            infoColor: Colors.red,
          ),
          footer: ClassicalFooter(
              textColor: Colors.grey,
              bgColor: Colors.white,
              infoText: '推广可观看更多影片',
              infoColor: Colors.red,
              loadedText: 'ddddd',
              noMoreText: '到底了~',
              loadingText: '正在加载'),
          controller: _controller,
          enableControlFinishLoad: true,
          enableControlFinishRefresh: true,
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return VideoPlayerPage(
                          url:
                              'http://api.dev.pear.pw/api/app/video_m3u8/index.m3u8?rate=360&license=U2FsdGVkX1%2FNmDuQMpCH%2FN3mPZ0DdDTv%2FuE6lhBAZImYInQAvh7a6h3%2BKIHb4T%2FzA57xZ4O5XbHXddbgXZIqZV4BhoqopAubyjST3hrU8Ww20C2I6bpvS8sOrGn9x3mtvmHElOP%2BqWatg%2F2Rvg2XRA%3D%3D',
                        );
                      }),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: list[index].base64Str == ''
                            ? getBase64(index)
                            : Image.memory(
                                base64.decode(list[index].base64Str),
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                gaplessPlayback: true,
                              ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 20),
                        child: Text(
                          '啊啊啊啊啊啊啊啊啊啊啊啊啊啊',
                          style: TextStyle(fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              }),
          onRefresh: () async {
            // 延时1s执行返回

            Future.delayed(Duration(seconds: 2), () {
              _controller.finishRefresh(success: true);
            });
          },
          onLoad: () async {
            List<DemoMo> list2 = List();
            for (int i = 0; i < 10; i++) {
              list2.add(DemoMo(''));
            }

            Future.delayed(Duration(seconds: 2)).then((value) => {
                  _controller.finishLoad(success: true, noMore: false),
                  setState(() {
                    list.addAll(list2);
                  }),
                });
          },
        ));
  }

  Widget getBase64(int index) {
    ImageDownHttp.getInstance().startDownLoad(
        'http://image.i438500.com/storage/images/video/thumbnail/d834f6a7f0dc4419c426ea952cf73bb5.raw!t!70!600.js',
        (values, status) {
      setState(() {
        list[index].base64Str = values;
      });
    });

    return Container(
      height: 200,
      color: Colors.grey[300],
    );
  }
}

class DemoMo {
  String base64Str = '';

  DemoMo(String base64Str) {
    this.base64Str = base64Str;
  }

  set mBase64Str(String base64Str) {
    base64Str = base64Str;
  }

  String get mBase64Str {
    return base64Str;
  }
}
