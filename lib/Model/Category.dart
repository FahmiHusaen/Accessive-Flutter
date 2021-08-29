class Category{
  int? categoryId;
  String? categoryTitle;
  String? categoryCode;
  String? categoryIcon;
  bool isChecked = false;

  Category({
    this.categoryId,
    this.categoryTitle,
    this.categoryCode,
    this.categoryIcon
  });

  Category.fromJson(Map<String, dynamic> json){
    categoryId = json['categoryId'];
    categoryTitle = json['categoryTitle'];
    categoryCode = json['categoryCode'];
    categoryIcon = json['categoryIcon'];
    isChecked = false;
  }

  Category.clone(Category newCategory){
    this.categoryId = newCategory.categoryId;
    this.categoryTitle = newCategory.categoryTitle;
    this.categoryCode = newCategory.categoryCode;
    this.categoryIcon = newCategory.categoryIcon;
    this.isChecked = newCategory.isChecked;
  }

}