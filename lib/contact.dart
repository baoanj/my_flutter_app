import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class MyContact extends StatefulWidget {
  @override
  _MyContactState createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  Iterable<Contact> _contacts;

  @override
  void initState() async {
    super.initState();
    Iterable<Contact> contacts =
        await ContactsService.getContacts(withThumbnails: false);
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    _contacts.forEach((item) {
      widgets.add(Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.blueGrey.shade100),
          ),
        ),
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                item.displayName + ': ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  item.phones.map((e) => e.value).join('\n'),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ));
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('联系人'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: widgets,
      ),
    );
  }
}
