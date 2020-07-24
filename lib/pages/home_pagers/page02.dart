import 'dart:convert';

import 'package:flutter/material.dart';
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
                            'http://video-qn.ibaotu.com/18/04/11/45p888piCB4r.mp4',
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
            }));
  }

  Widget getBase64(int index) {
    ImageDownHttp.getInstance().startDownLoad(
        'http://image.i438500.com/storage/images/video/thumbnail/936edb5d4c71976cb3a8b96afc9bf9cb.raw!t!70!600.js',
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
