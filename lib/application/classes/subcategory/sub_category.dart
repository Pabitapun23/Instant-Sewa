class SubCategory {
  int subCategoryId;
  String subCategoryName;
  String subCategoryImage;
  String categoryName;
  SubCategory.fromJson(Map<String, dynamic> jsonMap)
      : subCategoryId = jsonMap['identifier'],
        subCategoryName = jsonMap['title'],
        subCategoryImage = jsonMap['image'],
        categoryName = jsonMap['category'][0];
}
