import 'package:flutter/material.dart';

import 'components/button.dart';
import 'contact.dart';
// import 'kraken.dart';
import 'todo.dart';
import 'search.dart';
import 'device.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(primaryColor: Colors.blueGrey),
      home: MyHomePage(title: 'Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;

  void _gotoMyDevice() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new MyDevice()),
    );
  }

  void _gotoMyContact() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new MyContact()),
    );
  }

  // void _gotoMyKraken() {
  //   Navigator.push(
  //     context,
  //     new MaterialPageRoute(builder: (context) => new MyKraken()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 150,
                child: Column(
                  children: <Widget>[
                    Text('已输入$_count个字'),
                    Todo(
                      change: (val) {
                        setState(() {
                          _count = val.length;
                        });
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50.0),
                      child: Search(),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyButton(
                    type: 'text',
                    text: '设备信息',
                    action: _gotoMyDevice,
                  ),
                  MyButton(
                    type: 'text',
                    text: '联系人',
                    action: _gotoMyContact,
                  ),
                  // MyButton(
                  //   type: 'text',
                  //   text: '北海',
                  //   action: _gotoMyKraken,
                  // )
                ],
              ),
            ],
          )),
    );
  }
}
