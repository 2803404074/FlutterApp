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
    checkList.add(CheckMo("无法直播", false));
    checkList.add(CheckMo("无法直播", false));
    checkList.add(CheckMo("无法直播", false));
    checkList.add(CheckMo("无法直播", false));
    checkList.add(CheckMo("无法直播", false));
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
          body: Column(
            children: <Widget>[
              Text("反馈类型"),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                alignment: Alignment.center,
                // color: Colors.red,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    _buttonOptions(checkList[0], 0),
                    _buttonOptions(checkList[1], 1),
                    _buttonOptions(checkList[2], 2),
                    _buttonOptions(checkList[3], 3),
                    _buttonOptions(checkList[4], 4),
                    _buttonOptions(checkList[5], 5),
                  ],
                ),
              ),
              Text("反馈内容"),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(15),
                  constraints: BoxConstraints(
                    maxHeight: 300.0,
                    minHeight: 300.0,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 0, bottom: 4.0),
                  child: TextField(
                    autocorrect: false,
                    maxLines: null,
                    focusNode: _focusNodePassWord,
                    keyboardType: TextInputType.multiline,
                    autofocus: false,
                    decoration: InputDecoration.collapsed(
                      hintText: "备注",
                    ),
                  ),
                ),
                onTap: () {
                  _focusNodePassWord.requestFocus();
                },
              )
            ],
          )),
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
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          width: 108,
          height: 34,
          borderRadius: BorderRadius.circular(17),
          colors: [
            checkMo.isCheck
                ? Color.fromRGBO(251, 214, 138, 1)
                : Colors.red[300],
            checkMo.isCheck
                ? Color.fromRGBO(236, 173, 109, 1)
                : Colors.red[500],
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
