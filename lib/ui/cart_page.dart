import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          ListView.separated(
              itemBuilder: (context, index) {
                return _listItem();
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: 5)
        ],
      ),
    );
  }
}

Widget _listItem() {
  return InkWell(
    child: Container(
      height: 120,
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 100,
            margin: EdgeInsets.all(10.0),
            child: Image.network('src'),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
