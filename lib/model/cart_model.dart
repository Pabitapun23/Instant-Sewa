class Service {
  String categories;
  String img;
  String subCategories;
  List<String> subSubCategories;
  List<int> subSubCategoriesId;
  List<int> price;
  List<int> qty;
  List<String> desc;

  Service(
      {this.categories,
      this.img,
      this.subCategories,
      this.desc,
      this.subSubCategories,
      this.subSubCategoriesId,
      this.price,
      this.qty});
}
