import 'package:instantsewa/util/hexcode.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    return Drawer(
      child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: _purple),
          accountName: Text('User'),
          accountEmail: Text('User@gmail.com'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              'U',
              style: TextStyle(color: _purple),
            ),
          ),
        ),
        ListTile(
          title: Text('Home'),
          leading: Icon(Icons.home),
          trailing: Icon(Icons.arrow_right),
          onTap: () => Navigator.of(context).pop(),
        ),
        ListTile(
          title: Text('Settings'),
          leading: Icon(Icons.settings),
          trailing: Icon(Icons.arrow_right),
        ),
        ListTile(
          title: Text('Track Order'),
          leading: Icon(Icons.check_circle),
          trailing: Icon(Icons.arrow_right),
        ),
        ListTile(
          title: Text('Payment'),
          leading: Icon(Icons.attach_money),
          trailing: Icon(Icons.arrow_right),
        ),
        ListTile(
          title: Text('Feedback'),
          leading: Icon(Icons.feedback),
          trailing: Icon(Icons.arrow_right),
        ),
        ListTile(
          title: Text('About us'),
          leading: Icon(Icons.people),
          trailing: Icon(Icons.arrow_right),
        ),
      ]),
    );
  }
}
