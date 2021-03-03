import 'package:dio/dio.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/subcategory/sub_category.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';

abstract class SubCategoryRepository {
  Future<List<SubCategory>> getAllSubCategories(id);
}

class SubCategoryRepositoryImpl implements SubCategoryRepository {
  SubCategoryRepositoryImpl();

  @override
  Future<List<SubCategory>> getAllSubCategories(id) async {
    String url = '/category/' + id + '/subcategory/';
    try {
      final response = await InstantSewaAPI.dio.get(url,
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      List _temp = response.data['data'];
      List<SubCategory> _subCategories = _temp
          .map((subCategory) => SubCategory.fromJson(subCategory))
          .toList();
      return _subCategories;
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}
