import 'package:instantsewa/application/classes/category/category.dart';

abstract class CategoryRepository
{
 Future<List<Category>> getAllCategories();
}
class CategoryRepositoryImpl implements CategoryRepository{
  @override
  Future<List<Category>> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

}