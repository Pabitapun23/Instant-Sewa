import 'package:flutter/foundation.dart';

class Service {
  final String categories;
  final String img;
  final String subCategories;
  final List<String> subSubCategories;
  final List<String> subSubCategoriesImage;
  final List<String> subSubCategoriesId;
  final List<double> price;
  final List<int> qty;
  final List<String> desc;

  Service(
      {@required this.subSubCategoriesImage,
      @required this.categories,
      @required this.img,
      @required this.subCategories,
      @required this.desc,
      @required this.subSubCategories,
      @required this.subSubCategoriesId,
      @required this.price,
      @required this.qty});
}
