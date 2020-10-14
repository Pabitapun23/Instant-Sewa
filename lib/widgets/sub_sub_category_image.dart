import 'package:flutter/material.dart';
import 'package:instantsewa/providers/categories.dart';
import 'package:provider/provider.dart';

class SubSubCategoryImage extends StatelessWidget {
  final int subCategoryIndex;

  const SubSubCategoryImage({Key key, this.subCategoryIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final serviceData = Provider.of<Categories>(context);
    final img = serviceData.services[subCategoryIndex].img;
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage(
              img,
            ),
            fit: BoxFit.contain),
      ),
    );
  }
}
