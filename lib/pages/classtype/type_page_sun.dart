import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    super.build(context);

    /// see AutomaticKeepAliveClientMixin
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: GridView.builder(
          itemCount: 30,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //横向item数量
              crossAxisSpacing: 10.0, //水平距离
              mainAxisSpacing: 20.0, //垂直距离
              childAspectRatio: 1.04),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VideoPlayerPage(
                    url:
                        'http://api.dev.pear.pw/api/app/video_m3u8/index.m3u8?rate=360&license=U2FsdGVkX1%2FNmDuQMpCH%2FN3mPZ0DdDTv%2FuE6lhBAZImYInQAvh7a6h3%2BKIHb4T%2FzA57xZ4O5XbHXddbgXZIqZV4BhoqopAubyjST3hrU8Ww20C2I6bpvS8sOrGn9x3mtvmHElOP%2BqWatg%2F2Rvg2XRA%3D%3D',
                  );
                }));
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: FadeInImage.assetNetwork(
                        placeholder: "images/img_load.jpeg",
                        image:
                            'http://00.minipic.eastday.com/20170410/20170410150211_20a86b147c8417a18f26792a8f7c3c88_1.jpeg',
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        '酒店偷拍·经验丰富的男子带白领开放与朋友3p·美女停叫喊...',
                        style: TextStyle(fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
