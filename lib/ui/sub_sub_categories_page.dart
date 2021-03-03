import 'package:instantsewa/util/hexcode.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/widgets/sub_sub_category_image.dart';
import 'package:instantsewa/widgets/sub_sub_category_list.dart';

class SubSubCategoriesPage extends StatelessWidget {
  final String subCategoryIndex;
  final String subCategoryName;
  final String subCategoryImage;

  const SubSubCategoriesPage(
      {Key key,
      this.subCategoryIndex,
      this.subCategoryName,
      this.subCategoryImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text(subCategoryName),
        backgroundColor: _purple,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              child: ListView(children: [
                SubSubCategoryImage(
                  subCategoryImage: subCategoryImage,
                ),
                SubSubCategoryList(subCategoryIndex, subCategoryName),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
