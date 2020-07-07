import 'package:flutter/material.dart';

class Page02 extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Page02> with AutomaticKeepAliveClientMixin {
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
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, ids) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FadeInImage.assetNetwork(
                      placeholder: "images/img_load.jpeg",
                      image:
                          'http://00.minipic.eastday.com/20170410/20170410150211_20a86b147c8417a18f26792a8f7c3c88_1.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      '酒店偷拍·经验丰富的男子带白领开放与朋友3p·美女停叫喊...',
                      style: TextStyle(fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            }));
  }
}
