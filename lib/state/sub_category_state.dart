import 'package:instantsewa/application/classes/subcategory/sub_category.dart';
import 'package:instantsewa/repositories/sub_category_repository.dart';

class SubCategoryState {
  final SubCategoryRepository _subCategoryRepository;
  SubCategoryState(this._subCategoryRepository);
  List<SubCategory> _subCategories = [];
  List<SubCategory> get subCategories => _subCategories;
  Future getAllSubCategories(id) async {
    _subCategories = await _subCategoryRepository.getAllSubCategories(id);
  }
}
