import 'package:instantsewa/providers/categories.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/widgets/sub_sub_category_image.dart';
import 'package:instantsewa/widgets/sub_sub_category_list.dart';
import 'package:provider/provider.dart';

class SubSubCategoriesPage extends StatelessWidget {
  final int subCategoryIndex;

  const SubSubCategoriesPage({Key key, this.subCategoryIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final serviceData = Provider.of<Categories>(context);
    final service = serviceData.services;
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text(service[subCategoryIndex].subCategories),
        backgroundColor: _purple,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              child: ListView(children: [
                SubSubCategoryImage(
                  subCategoryIndex: subCategoryIndex,
                ),
                SubSubCategoryList(
                  subCategoryIndex: subCategoryIndex,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
