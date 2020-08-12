import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/pages/player/video_player_pager.dart';

class TypePageSun extends StatefulWidget {
  @override
  _TypePageSunState createState() => _TypePageSunState();
}

class _TypePageSunState extends State<TypePageSun>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ///see AutomaticKeepAliveClientMixin
  EasyRefreshController _controller = EasyRefreshController();
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
            loadedText: '加载完成',
            noMoreText: '到底了~',
            loadingText: '正在加载'),
        controller: _controller,
        enableControlFinishLoad: true,
        enableControlFinishRefresh: true,
        onRefresh: () async {
          // 延时1s执行返回

          Future.delayed(Duration(seconds: 2), () {
            _controller.finishRefresh(success: true);
          });
        },
        onLoad: () async {
          Future.delayed(Duration(seconds: 2)).then((value) => {
                _controller.finishLoad(success: true, noMore: true),
              });
        },
        child: GridView.builder(
            itemCount: 30,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //横向item数量
              crossAxisSpacing: 5.0, //水平距离
              mainAxisSpacing: 20.0, //垂直距离
              //childAspectRatio: 1.04,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VideoPlayerPage(
                      url:
                          'http://api.dev.pear.pw/api/app/video_m3u8/index.m3u8?rate=360&license=U2FsdGVkX1%2FMCJMbgToMum3O00Z3nqmF10HSknltQz7%2FfSuqUVsxD7HTGRzZhEhRX2TgjopOkLap0HgsM33zgPGc3lFomGuDvPJ5hwrafzIm7OuMnz0omRK%2BieVAxVh%2Fd0ynBdFc6Hu6kCQObdb2qw%3D%3D',
                    );
                  }));
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: FadeInImage.assetNetwork(
                          placeholder: "images/img_load.jpeg",
                          image:
                              'http://00.minipic.eastday.com/20170410/20170410150211_20a86b147c8417a18f26792a8f7c3c88_1.jpeg',
                          height: ScreenUtil().setHeight(225),
                          width: ScreenUtil().setWidth(335),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          '酒店偷拍·经验丰富的男子带白领开放与朋友3p·美女停叫喊...',
                          style: TextStyle(fontSize: ScreenUtil().setSp(24)),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
