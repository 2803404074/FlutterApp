import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/pages/player/video_player_pager.dart';
import 'package:flutterapp/widget/tagView.dart';
import 'package:flutterapp/widget/RoundCheckBox.dart';

class CollectionPage extends StatefulWidget {
  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class CollectionMode {
  String name;

  CollectionMode(String name) {
    this.name = name;
  }
}

class _CollectionPageState extends State<CollectionPage> {
  //是否显示复选框
  var isShowEditor = false;

  List<CollectionMode> items = List();

  List<bool> _isChecks = List();

  List<String> itemsTag = List();

  var actionTitle = "编辑";
  EasyRefreshController _controller = EasyRefreshController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 20; i++) {
      items.add(CollectionMode('标题标题标题标题标题标题标题标题'));

      _isChecks.add(false);
    }
    itemsTag.add('日本');
    itemsTag.add('美女');
    itemsTag.add('AV');
    itemsTag.add('自拍');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的收藏'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                isShowEditor = !isShowEditor;
                if (actionTitle == "编辑") {
                  actionTitle = "完成";
                  //清空选中
                  for (int i = 0; i < _isChecks.length; i++) {
                    _isChecks[i] = false;
                  }
                } else {
                  actionTitle = "编辑";
                }
              });
            },
            child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  actionTitle,
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
      body: EasyRefresh(
        header: ClassicalHeader(
          refreshText: '下拉刷新',
          refreshReadyText: '松手刷新',
          refreshedText: '刷新成功',
          refreshingText: '正在加载',
          refreshFailedText: '加载失败',
          textColor: Colors.grey,
          bgColor: Colors.white,
          infoText: '上次刷新 %T',
          infoColor: Colors.red,
        ),
        footer: ClassicalFooter(
            textColor: Colors.grey,
            bgColor: Colors.white,
            infoText: '推广可观看更多影片',
            infoColor: Colors.red,
            loadedText: 'ddddd',
            noMoreText: '到底了~',
            loadingText: '正在加载'),
        controller: _controller,
        enableControlFinishLoad: true,
        enableControlFinishRefresh: true,
        onRefresh: () async {
          // 延时1s执行返回

          Future.delayed(Duration(seconds: 2), () {
            _controller.finishRefresh(success: true);
          });
        },
        onLoad: () async {
          Future.delayed(Duration(seconds: 2)).then((value) => {
                _controller.finishLoad(success: true, noMore: false),
              });
        },
        child: ListView.builder(
            itemCount: items.length,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    if (isShowEditor) {
                      setState(() {
                        _isChecks[index] = !_isChecks[index];
                      });
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return VideoPlayerPage(
                            url:
                                'http://api.dev.pear.pw/api/app/video_m3u8/index.m3u8?rate=360&license=U2FsdGVkX1%2FNmDuQMpCH%2FN3mPZ0DdDTv%2FuE6lhBAZImYInQAvh7a6h3%2BKIHb4T%2FzA57xZ4O5XbHXddbgXZIqZV4BhoqopAubyjST3hrU8Ww20C2I6bpvS8sOrGn9x3mtvmHElOP%2BqWatg%2F2Rvg2XRA%3D%3D');
                      }));
                    }
                  },
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Offstage(
                            offstage: !isShowEditor,
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              alignment: Alignment.center,
                              child: RoundCheckBox(
                                value: _isChecks[index],
                                onChanged: (isTrue) {
                                  setState(() {
                                    print('执行');
                                    _isChecks[index] = isTrue;
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: ClipRRect(
                              child: Image.network(
                                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2307511656,3386189028&fm=26&gp=0.jpg',
                                fit: BoxFit.cover,
                                height: ScreenUtil().setHeight(225),
                                width: ScreenUtil().setWidth(335),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            height: ScreenUtil().setHeight(225),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: Text(
                                    '酒店偷拍，经验酒店偷拍，经验酒店偷拍，经验酒店偷拍，经验酒店偷拍，经验',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(28)),
                                  ),
                                ),
                                Wrap(
                                  children: <Widget>[
                                    TagView(
                                      tags: itemsTag,
                                      backgroundColor: null,
                                      itemStyle: TextStyle(
                                          color: Color(0xff924949),
                                          fontSize: ScreenUtil().setSp(22)),
                                      radius: 15,
                                      itemPadding: EdgeInsets.only(
                                          left: ScreenUtil().setWidth(21),
                                          right: ScreenUtil().setWidth(21),
                                          bottom: ScreenUtil().setWidth(8),
                                          top: ScreenUtil().setWidth(8)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                      Offstage(
                        offstage: index != items.length - 1 ? false : true,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          child: Divider(
                            height: 1,
                          ),
                        ),
                      )
                    ],
                  ));
            }),
      ),
    );
  }

  bool aaaaa() {}
}
