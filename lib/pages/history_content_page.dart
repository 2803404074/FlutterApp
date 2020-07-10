import 'package:flutter/material.dart';
import 'package:flutterapp/widget/tagView.dart';

class HistoryContentPage extends StatefulWidget {
  HistoryContentPage({Key key}) : super(key: key);

  @override
  _HistoryContentPageState createState() => _HistoryContentPageState();
}

class _HistoryContentPageState extends State<HistoryContentPage> {
  List<String> tags = [
    '多人运动',
    '无码高清',
    '无套内射',
    '少妇系列',
    '制服诱惑',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: new EdgeInsets.all(5.0),
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Row(
              children: <Widget>[
                Image.asset(
                  "images/img_load.jpeg",
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "酒店自拍 经验丰富的男子带白领开发与朋友3p",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    TagView(
                      tags: tags,
                      backgroundColor: null,
                      itemStyle: TextStyle(color: Colors.red, fontSize: 11),
                      radius: 9,
                      tagHeight: 18,
                      width: 250,
                    ),
                  ],
                ),
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
