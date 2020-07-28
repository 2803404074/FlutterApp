import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
    with AutomaticKeepAliveClientMixin {
  Widget content;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    if (content == null) {
      print('游戏页build');
      content = Scaffold(
          body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Image.network(
          'http://pic.96u.com/Uploads/Picture/2017-02-12/589fc9a8ebd6c.jpg',
          fit: BoxFit.fill,
        ),
      ));
    } else {
      print('游戏缓存页');
    }

    return content;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
