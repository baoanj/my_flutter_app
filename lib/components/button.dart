import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({Key key, this.type, this.text, this.action}) : super(key: key);

  final String type;
  final String text;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: type == 'text'
          ? TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                  ),
                  textStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 16, color: Color(0xff5078ff)))),
              onPressed: action,
              child: Text(text),
            )
          : ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                  ),
                  backgroundColor: MaterialStateProperty.all(Color(0xff5078ff)),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 16))),
              onPressed: action,
              child: Text(text),
            ),
    );
  }
}
