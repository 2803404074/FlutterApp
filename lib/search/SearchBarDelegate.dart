import 'package:flutter/material.dart';

typedef SearchItemCall = void Function(String item);

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => '想看些什么';

  @override
  List<Widget> buildActions(BuildContext context) {
    //右侧显示内容 这里放清除按钮
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //左侧显示内容 这里放了返回按钮
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //添加历史数据
    //点击了搜索显示的页面
    return Center(
      child: Text('12312321'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //点击了搜索窗显示的页面
    return SearchContentView();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context);
  }
}

class SearchContentView extends StatefulWidget {
  @override
  _SearchContentViewState createState() => _SearchContentViewState();
}

class _SearchContentViewState extends State<SearchContentView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '大家都在搜',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SearchItemView(),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '历史记录',
              style: TextStyle(fontSize: 16),
            ),
          ),
          HistoryItemView(),
        ],
      ),
    );
  }
}

//热门数据
class SearchItemView extends StatefulWidget {
  @override
  _SearchItemViewState createState() => _SearchItemViewState();
}

//热门数据
class _SearchItemViewState extends State<SearchItemView> {
  List<String> items = [
    '复仇者联盟',
    '小猪佩奇',
    '苍井空',
    '波多野结衣',
    '国产',
    '偷拍',
    '大杂烩',
    '日本AV',
    '欧美电影'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 10,
        // runSpacing: 0,
        children: items.map((item) {
          return SearchItem(title: item);
        }).toList(),
      ),
    );
  }
}

//历史数据
class HistoryItemView extends StatefulWidget {
  @override
  _HistoryItemViewState createState() => _HistoryItemViewState();
}

//历史数据
class _HistoryItemViewState extends State<HistoryItemView> {
  List<String> items = [
    '123',
    '456',
    '789',
    '987',
    '654',
    '321',
    '123',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 10,
        // runSpacing: 0,
        children: items.map((item) {
          return SearchItem(title: item);
        }).toList(),
      ),
    );
  }
}

class SearchItem extends StatefulWidget {
  @required
  final String title;
  const SearchItem({Key key, this.title}) : super(key: key);
  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Chip(
          label: Text(widget.title),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onTap: () {
          print(widget.title);
        },
      ),
    );
  }
}
