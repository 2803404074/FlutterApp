import 'package:flutter/material.dart';

import '../widget/GradientButton.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({Key key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  FocusNode _focusNodePassWord = FocusNode();
  List<CheckMo> checkList = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkList.add(CheckMo("无法直播", false));
    checkList.add(CheckMo("播放卡顿", false));
    checkList.add(CheckMo("搜索不准", false));
    checkList.add(CheckMo("推荐不准", false));
    checkList.add(CheckMo("无法下载", false));
    checkList.add(CheckMo("其他", false));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.navigate_before),
          centerTitle: true,
          title: Text("意见反馈"),
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15, top: 15),
                  alignment: Alignment.topLeft,
                  child: Text("反馈类型",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: GridView.builder(
                      padding: EdgeInsets.all(0.0),
                      itemCount: 6,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //横向item数量
                        crossAxisSpacing: 10.0, //水平距离
                        mainAxisSpacing: 10.0, //垂直距离
                        childAspectRatio: 3.1,
                      ),
                      itemBuilder: (context, index) {
                        return _buttonOptions(checkList[index], index);
                      }),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 15, top: 25),
                  child: Text(
                    "反馈内容",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                // 反馈内容
                GestureDetector(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(15),
                    constraints: BoxConstraints(
                      maxHeight: 137.0,
                      minHeight: 137.0,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    padding: EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 0, bottom: 4.0),
                    child: TextField(
                      autocorrect: false,
                      maxLines: null,
                      focusNode: _focusNodePassWord,
                      keyboardType: TextInputType.multiline,
                      autofocus: false,
                      decoration: InputDecoration.collapsed(
                        hintText: "请输入您的问题~~~",
                      ),
                    ),
                  ),
                  onTap: () {
                    _focusNodePassWord.requestFocus();
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40, top: 55),
                  child: GradientButton(
                    child: Text(
                      "提交",
                      style: TextStyle(fontSize: 14),
                    ),
                    height: 44,
                    colors: [
                      Color.fromRGBO(255, 91, 89, 1),
                      Color.fromRGBO(255, 40, 37, 1)
                    ],
                    borderRadius: BorderRadius.circular(22),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonOptions(CheckMo checkMo, int index) => Container(
        child: GradientButton(
          onPressed: () {
            setState(() {
              checkList[index].isCheck = !checkList[index].isCheck;
            });
          },
          child: Text(
            checkMo.text,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight:
                    checkMo.isCheck ? FontWeight.w500 : FontWeight.w300),
          ),
          // width: 108,
          // height: 34,
          border: Border.all(
              width: 0.5,
              color: checkMo.isCheck
                  ? Colors.white
                  : Color.fromRGBO(234, 234, 234, 1)),
          borderRadius: BorderRadius.circular(20),
          colors: [
            checkMo.isCheck ? Color.fromRGBO(251, 214, 138, 1) : Colors.white,
            checkMo.isCheck ? Color.fromRGBO(236, 173, 109, 1) : Colors.white,
          ],
        ),
      );
}

class CheckMo {
  String text;
  bool isCheck;
  CheckMo(String text, bool isCheck) {
    this.text = text;
    this.isCheck = isCheck;
  }
}
