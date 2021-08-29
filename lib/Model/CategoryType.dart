import 'package:flutter_appbb/Model/Category.dart';

class CategoryType{
  String? categoryTypeTitle;
  int? categoryTypeId;
  bool isChecked = false;
  List<Category>? categoryList;

  CategoryType({
    this.categoryTypeTitle,
    this.categoryTypeId
  });

  CategoryType.fromJson(Map<String, dynamic> json){
    categoryTypeTitle = json['categoryTypeTitle'];
    categoryTypeId = json['categoryTypeId'];
  }
}