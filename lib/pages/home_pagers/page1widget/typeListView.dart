import 'package:flutter/material.dart';
/**
 * 首页-其他视频列表
 */

class TypeListView extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<TypeListView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ///see AutomaticKeepAliveClientMixin

  @override
  Widget build(BuildContext context) {
    super.build(context);

    List<String> datas = getDataList();

    /// see AutomaticKeepAliveClientMixin
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '日本无码',
            textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3532249801,4016244769&fm=26&gp=0.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 320,
            child: GridView.builder(
                itemCount: 4,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //横轴元素个数
                    crossAxisCount: 2,
                    //纵轴间距
                    mainAxisSpacing: 20.0,
                    //横轴间距
                    crossAxisSpacing: 10.0,
                    //子组件宽高长度比例
                    childAspectRatio: 1.3),
                itemBuilder: (BuildContext context, int index) {
                  return getItemContainer(datas[index]);
                }),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/home_more.png',
                      width: 20,
                      fit: BoxFit.cover,
                    ),
                    Text(' '),
                    Text(
                      '更多',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
                color: Color(0x80DCDCDC),
                height: 38,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getItemContainer(String item) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
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
      ),
    );
  }

  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(i.toString());
    }
    return list;
  }
}
