import 'package:flutter/material.dart';
import 'package:flutterapp/pages/player/video_player_pager.dart';
import 'package:flutterapp/widget/tagView.dart';

class HistoryContentPage extends StatefulWidget {
  HistoryContentPage({Key key}) : super(key: key);

  @override
  _HistoryContentPageState createState() => _HistoryContentPageState();
}

class _HistoryContentPageState extends State<HistoryContentPage> {
  List<String> tags = [
    '多人运动',
    '无码',
    '无套内射',
    '少妇系',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 5,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return VideoPlayerPage(
                    url:
                        'http://video-qn.ibaotu.com/18/04/11/45p888piCB4r.mp4');
              }));
            },
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: ClipRRect(
                        child: Image.network(
                          'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2307511656,3386189028&fm=26&gp=0.jpg',
                          fit: BoxFit.cover,
                          height: 120,
                          width: 160,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              '酒店偷拍，经验酒店偷拍，经验酒店偷拍，经验酒店偷拍，经验酒店偷拍，经验',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                              child: Wrap(
                            children: <Widget>[
                              TagView(
                                tags: tags,
                                backgroundColor: null,
                                itemStyle:
                                    TextStyle(color: Colors.red, fontSize: 11),
                                radius: 9,
                                tagHeight: 18,
                                itemPadding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 2),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ))
                  ],
                ),
                Offstage(
                  offstage: index != 5 - 1 ? false : true,
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    child: Divider(
                      height: 1,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> getChile() {
    List<Widget> a = List();
    for (int i = 0; i < 4; i++) {
      a.add(Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Text(
          '精品',
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: Color(0x80000000),
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ));
    }
    return a;
  }
}
