 class Category{
  String categoryId;
  String categoryName;
  String categoryDetail;
  String categoryImage;
  Category.fromJson(Map<String,dynamic> jsonMap):
      categoryId = jsonMap['identifier'] ?? 0,
        categoryName = jsonMap['title'] ?? "",
        categoryDetail = jsonMap['details'] ?? "",
        categoryImage = jsonMap['image'] ?? "";
}