import 'dart:convert';
import 'package:instantsewa/model/api_response.dart';
import 'package:instantsewa/model/category_model.dart';
import 'package:instantsewa/util/api.dart';
class CategoriesService {

  Future<APIResponse<List<Category>>> getCategoriesList() async {
    var res = await Network().getData('/categories');
    if (res.statusCode == 200) {
      final jsonData = json.decode(res.body);
      final categories = <Category>[];
      for (var item in jsonData) {
        categories.add(Category.fromJson(item));
      }
      return APIResponse<List<Category>>(data: categories);
    }
    return APIResponse<List<Category>>(
        error: true, errorMessage: 'An error occured');
  }
}
