import 'package:flutter/material.dart';

import 'components/webview.dart';
import 'components/button.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchController = TextEditingController();

  void _searchBaidu() {
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new MyWebView(
              url: 'https://www.baidu.com/s?wd=' + searchController.text,
              title: '百度')),
    );
  }

  void _searchBing() {
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new MyWebView(
              url: 'https://cn.bing.com/search?q=' + searchController.text,
              title: '必应')),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: searchController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: '请输入',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                text: '百度',
                action: _searchBaidu,
              ),
              MyButton(
                text: '必应',
                action: _searchBing,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
