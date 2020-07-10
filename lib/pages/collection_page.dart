import 'package:flutter/material.dart';
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
        body: ListView.builder(
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
                      print('跳转');
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
                                Wrap(
                                  children: <Widget>[
                                    TagView(
                                      tags: itemsTag,
                                      backgroundColor: null,
                                      itemStyle: TextStyle(
                                          color: Colors.red, fontSize: 11),
                                      radius: 9,
                                      tagHeight: 18,
                                      itemPadding: EdgeInsets.only(
                                          left: 10, right: 10, bottom: 2),
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
            }));
  }

  bool aaaaa() {}
}
