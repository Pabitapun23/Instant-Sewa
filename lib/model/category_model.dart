class Category {
  String categoryId;
  String categoryName;
  String categoryDetails;
  String categoryImage;

  Category({
    this.categoryId,
    this.categoryName,
    this.categoryDetails,
    this.categoryImage,
  });
  factory Category.fromJson(Map<String, dynamic> item) {
    return Category(
      categoryId: item['identifier'],
      categoryName: item['title'],
      categoryDetails: item['details'],
      categoryImage: item['image'],
    );
  }
}
