import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({Key key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("意见反馈"),
          ),
          body: Column(
            children: <Widget>[
              Text("反馈类型"),
              Wrap(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    child: Text("无法播放"),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
