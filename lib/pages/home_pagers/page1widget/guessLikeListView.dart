import 'package:flutter/material.dart';
import 'package:flutterapp/pages/player/video_player_pager.dart';

/**
 * 首页第一选显卡-猜你喜欢列表
 */
class GuessLikeListView extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<GuessLikeListView>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  bool get wantKeepAlive => true;

  ///see AutomaticKeepAliveClientMixin
  ///
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  String aaa = "猜你喜欢猜你喜欢猜你喜欢猜你喜欢";
  @override
  Widget build(BuildContext context) {
    super.build(context);

    List<String> datas = getDataList();

    /// see AutomaticKeepAliveClientMixin
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '猜你喜欢',
          textAlign: TextAlign.right,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
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
        InkWell(
          splashColor: Color(0x00ffffff),
          onTap: () {
            controller.reset();
            controller.forward();
            setState(() {
              aaa = '换一换';
            });
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RotationTransition(
                      //将要执行动画的子view
                      child: Image.asset(
                        'images/home_change.png',
                        width: 20,
                        fit: BoxFit.cover,
                      ),
                      //设置动画的旋转中心
                      alignment: Alignment.center,
                      //动画控制器
                      turns: controller,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '换一换',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
                color: Color(0x80DCDCDC),
                height: 38,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getItemContainer(String item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return VideoPlayerPage(
              url: 'http://video-qn.ibaotu.com/18/04/11/45p888piCB4r.mp4');
        }));
      },
      child: Container(
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
              aaa,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ],
        ),
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
