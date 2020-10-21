import 'package:flutter/material.dart';

class SubSubCategoryImage extends StatelessWidget {
  final String subCategoryImage;

  const SubSubCategoryImage({Key key, this.subCategoryImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage(subCategoryImage), fit: BoxFit.contain),
      ),
    );
  }
}
