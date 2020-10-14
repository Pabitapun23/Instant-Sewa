import 'package:instantsewa/application/classes/category/category.dart';
import 'package:instantsewa/repositories/category_repository.dart';

class CategoryState
{
  final CategoryRepository _categoryRepository;
  CategoryState(this._categoryRepository);
  List<Category> _categories = [];
  List<Category> get categories => _categories;
  Future getAllCategories() async
  {
    _categories= await _categoryRepository.getAllCategories();
  }
}