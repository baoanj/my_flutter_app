import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';

import 'data/private.dart';
import 'components/button.dart';

class Todo extends StatefulWidget {
  Todo({Key key, this.change}) : super(key: key);

  final Function change;

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final todoController = TextEditingController();

  void _initLeanCloud() {
    LeanCloud.initialize(
      LeanInfo.APPID,
      LeanInfo.APPKEY,
      server: LeanInfo.SERVER,
    );
  }

  void _getTodo() async {
    LCQuery<LCObject> query = LCQuery('Todo');
    LCObject todo = await query.get(LeanInfo.OBJECTID);
    todoController.text = todo['content'];
  }

  void _saveTodo() async {
    LCObject todo = LCObject.createWithoutData('Todo', LeanInfo.OBJECTID);
    todo['content'] = todoController.text;
    await todo.save();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: const Text('保存成功')));
  }

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initLeanCloud();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: todoController,
          minLines: 5,
          maxLines: 10,
          onChanged: widget.change,
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
                text: '获取',
                action: _getTodo,
              ),
              MyButton(
                text: '保存',
                action: _saveTodo,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
