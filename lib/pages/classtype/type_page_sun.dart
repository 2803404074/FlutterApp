import 'package:flutter/material.dart';

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
            return Container(
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
            );
          }),
    );
  }
}
