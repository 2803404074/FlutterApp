import 'package:flutter/material.dart';

/**
 * 首页第一选显卡-推荐列表
 */
class RecommentListView extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<RecommentListView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ///see AutomaticKeepAliveClientMixin

  @override
  Widget build(BuildContext context) {
    super.build(context);

    /// see AutomaticKeepAliveClientMixin
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '热门推荐',
          textAlign: TextAlign.right,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 130,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, ids) {
                return Column(
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 100,
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
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
                );
              }),
        )
      ],
    );
  }
}
