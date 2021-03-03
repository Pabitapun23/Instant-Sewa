 class Category{
  String categoryId;
  String categoryName;
  String categoryImage;
  Category.fromJson(Map<String,dynamic> jsonMap):
      categoryId = jsonMap['identifier'].toString(),
        categoryName = jsonMap['title'],
        categoryImage = jsonMap['image'];
}