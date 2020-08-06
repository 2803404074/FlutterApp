import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/widget/GradientButton.dart';

class ExtensionPage extends StatefulWidget {
  @override
  _ExtensionPageState createState() => _ExtensionPageState();
}

class _ExtensionPageState extends State<ExtensionPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            '推广中心',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.navigate_before,
              color: Colors.grey,
            ),
          ),
        ),
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return getContent();
                case 1:
                  return getCard();
                case 2:
                  return extensionBtn;
                case 3:
                  return Container(
                      margin: EdgeInsets.only(
                          left: 20, bottom: ScreenUtil().setHeight(30)),
                      child: Text(
                        '等级提升',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ));
                case 4:
                  return extensionList;
              }
            }));
  }

  Widget getContent() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      height: ScreenUtil().setHeight(567),
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(64)),
      child: Image.asset('images/extension_top_bg.png',
          width: double.infinity, fit: BoxFit.fitHeight),
    );
  }

  Widget getCard() {
    return Stack(
      children: <Widget>[
        Container(
            height: 120,
            width: double.infinity,
            margin: EdgeInsets.only(
                left: 20, right: 20, top: ScreenUtil().setHeight(58)),
            //边框设置
            decoration: new BoxDecoration(
              //背景
              color: Color(0xffFFF4F4),
              //设置四周圆角 角度
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //设置四周边框
              border: new Border.all(width: 1, color: Color(0xffFFF4F4)),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'images/img_load.jpeg',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'LV1/英勇黄铜',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(28),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Expanded(child: Text('')),
                        SizedBox(
                            height: 10.0,
                            width: 170,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              child: LinearProgressIndicator(
                                value: 0.6,
                                backgroundColor: Color(0xffFFE3E3),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xffFD6645)),
                              ),
                            )),
                        Expanded(child: Text('')),
                        Text.rich(
                          TextSpan(
                              text: '距离升级下一个等级还差',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setSp(26)),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '10',
                                    style: TextStyle(
                                        color: Color(0xffFD6645),
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text: '人',
                                    style: TextStyle(color: Colors.black)),
                              ]),
                          textAlign: TextAlign.end,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 20, top: ScreenUtil().setHeight(58)),
          child: Image.asset(
            'images/extention_right.png',
            width: 50,
            height: 30,
            alignment: Alignment.topRight,
          ),
        ),
        Container(
            margin: EdgeInsets.only(right: 20),
            width: double.infinity,
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(64), right: 5),
            child: Text(
              "当前等级",
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ))
      ],
    );
  }

//推广按钮
  Widget extensionBtn = Container(
    margin: EdgeInsets.fromLTRB(35, 30, 35, 30),
    child: GradientButton(
      child: Text('立即推广'),
      height: 50,
      width: 200,
      shadow: Color(0xffFF5B59),
      colors: [Color(0xffFF5B59), Color(0xffFF2825)],
      onPressed: () {},
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  );

  //等级列表

  Widget extensionList = Container(
    child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (contex, ids) {
          return Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), 0,
                ScreenUtil().setWidth(30), ScreenUtil().setWidth(20)),
            height: ScreenUtil().setHeight(175),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                color: Colors.white,
                height: ScreenUtil().setHeight(175),
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(34),
                    right: ScreenUtil().setWidth(34),
                    top: ScreenUtil().setWidth(40),
                    bottom: ScreenUtil().setWidth(40)),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'images/img_load.jpeg',
                      width: ScreenUtil().setWidth(100),
                      height: ScreenUtil().setHeight(100),
                      fit: BoxFit.cover,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: ScreenUtil().setWidth(26)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(child: SizedBox()),
                          Text(
                            '英勇黄铜',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Text.rich(
                            TextSpan(
                                text: '累计推广',
                                style: TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '1',
                                      style: TextStyle(
                                        color: Color(0xff433528),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )),
                                  TextSpan(
                                      text: '人,每日观影次数',
                                      style: TextStyle(
                                        color: Color(0xff666666),
                                        fontSize: 12,
                                      )),
                                  TextSpan(
                                      text: '+1',
                                      style: TextStyle(
                                        color: Color(0xff433528),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )),
                                  TextSpan(
                                      text: ',畅想',
                                      style: TextStyle(
                                        color: Color(0xff666666),
                                        fontSize: 12,
                                      )),
                                  TextSpan(
                                      text: '标清',
                                      style: TextStyle(
                                        color: Color(0xff433528),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )),
                                  TextSpan(
                                      text: '片源',
                                      style: TextStyle(
                                        color: Color(0xff666666),
                                        fontSize: 12,
                                      )),
                                ]),
                          ),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
  );
}
