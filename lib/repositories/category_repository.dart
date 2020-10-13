import 'package:dio/dio.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/category/category.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';

abstract class CategoryRepository
{
 Future<List<Category>> getAllCategories();
}
class CategoryRepositoryImpl implements CategoryRepository{
  @override
  Future<List<Category>> getAllCategories() async {
    try{
      final response = await InstantSewaAPI.dio.get("/category",options: Options(
        headers: {
          'Authorization':"Bearer ${LocalStorage.getItem(TOKEN)}"
        }
      ));
      List _temp = response.data['data'];
      List<Category> _categories = _temp.map((category) => Category.fromJson(category)).toList();
      return _categories;
      
    }on DioError catch(e){
      throw showNetworkError(e);
    }
  }

}