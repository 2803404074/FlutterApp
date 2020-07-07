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
        color: Colors.white,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, ids) {
              return Card(
                elevation: 10,
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: Container(
                  color: Colors.white,
                  height: 250,
                  child: Column(
                    children: <Widget>[
                      Image.network(
                          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593772644391&di=564251f047eee64f0e422e47ef1d772d&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F66%2F53%2F01300001373640131675539310611.jpg'),
                      Text('数据数据数据数据数据数据数据数据数据数据')
                    ],
                  ),
                ),
              );
            }));
  }
}
