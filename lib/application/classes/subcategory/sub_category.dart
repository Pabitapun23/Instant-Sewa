class SubCategory {
  String subCategoryId;
  String subCategoryName;
  String subCategoryImage;
  String categoryName;
  SubCategory.fromJson(Map<String, dynamic> jsonMap)
      : subCategoryId = jsonMap['identifier'].toString(),
        subCategoryName = jsonMap['title'],
        subCategoryImage = jsonMap['image'],
        categoryName = jsonMap['category'][0];
}
