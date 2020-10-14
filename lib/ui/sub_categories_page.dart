import 'package:instantsewa/util/hexcode.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/widgets/sub_catergory_list.dart';

class SubCategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text('Electrical Services'),
        backgroundColor: _purple,
      ),
      body: Container(
        child: ListView(children: [
          SubCategoriesList(),
        ]),
      ),
    );
  }
}
