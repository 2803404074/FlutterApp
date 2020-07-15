import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp/pages/classtype/type_page.dart';
import 'package:flutterapp/pages/home_pagers/page1widget/guessLikeListView.dart';
import 'package:flutterapp/pages/home_pagers/page1widget/recommentListView.dart';
import 'package:flutterapp/pages/home_pagers/page1widget/typeListView.dart';

class Page01 extends StatefulWidget {
  @override
  _Pages01State createState() => _Pages01State();
}

class _Pages01State extends State<Page01> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<Widget> imageList = List();

  ///see AutomaticKeepAliveClientMixin

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageList.add(Image.network(
      'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2307511656,3386189028&fm=26&gp=0.jpg',
      fit: BoxFit.cover,
    ));
    imageList.add(Image.network(
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3404221704,526751635&fm=26&gp=0.jpg',
      fit: BoxFit.cover,
    ));
    imageList.add(Image.network(
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3532249801,4016244769&fm=26&gp=0.jpg',
      fit: BoxFit.cover,
    ));
    imageList.add(Image.network(
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593776827675&di=199902704aeedd6ca8bcdcd708720124&imgtype=0&src=http%3A%2F%2Fpic.90sjimg.com%2Fdesign%2F00%2F66%2F91%2F14%2Fs_1024_5772158596e2d.jpg',
      fit: BoxFit.cover,
    ));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    /// see AutomaticKeepAliveClientMixin
    // TODO: implement build
    return CustomScrollView(
      shrinkWrap: true,
      //内容
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(0.0),
          sliver: SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xffFF2825),
                    Color(0xffFF5B59),
                  ])),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  height: 150,
                  child: Swiper(
                    itemCount: 4,
                    itemBuilder: _swiperBuilder,
                    pagination: SwiperPagination(
                        alignment: Alignment.bottomRight,
                        margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                        builder: DotSwiperPaginationBuilder(
                            color: Color(0x80ffffff), activeColor: Colors.red)),
                    controller: SwiperController(),
                    scrollDirection: Axis.horizontal,
                    autoplay: true,
                    onTap: (index) => print('点击了第$index'),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                          child: Column(
                            children: <Widget>[
                              FadeInImage.assetNetwork(
                                placeholder: "images/img_load.jpeg",
                                image:
                                    'http://p9.pccoo.cn/weixin/20171113/2017111316565418467518_1080_1080.jpg',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Text(
                                  '无码素人',
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return TypePage();
                            }));
                          })),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                          child: Column(
                            children: <Widget>[
                              FadeInImage.assetNetwork(
                                placeholder: "images/img_load.jpeg",
                                image:
                                    'http://ku.90sjimg.com/element_origin_min_pic/00/86/24/3156eade908f1d1.jpg',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Text(
                                  '国产自拍',
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return TypePage();
                            }));
                          })),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                          child: Column(
                            children: <Widget>[
                              FadeInImage.assetNetwork(
                                placeholder: "images/img_load.jpeg",
                                image:
                                    'http://e0.ifengimg.com/05/2019/0227/4FF08CBB201C96B45205D381BC106BFE537F4BFE_size19_w300_h300.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Text(
                                  '人气淑女',
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return TypePage();
                            }));
                          })),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                          child: Column(
                            children: <Widget>[
                              FadeInImage.assetNetwork(
                                placeholder: "images/img_load.jpeg",
                                image:
                                    'http://bpic.588ku.com/element_origin_min_pic/17/08/10/3e9752eebe792b296e7c77d860ad8484.jpg%21/fwfh/804x804/quality/90/unsharp/true/compress/true',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Text(
                                  '角色扮演',
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return TypePage();
                            }));
                          }))
                ],
              ),
            ),
            Container(
              height: 100,
              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2626086796,2112736301&fm=26&gp=0.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //视频列表,推荐视频
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: RecommentListView(),
            ),

            //视频列表,猜你喜欢
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: GuessLikeListView(),
            ),

            // //视频列表,国产自拍
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, ids) {
                    return TypeListView();
                  }),
            ),
          ])),
        )
      ],
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    // return (imageList[index]);
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10), child: imageList[index]),
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
}
