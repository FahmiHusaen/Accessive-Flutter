import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/RegularAppBar.dart';
import 'package:flutter_appbb/Components/SearchAppBar.dart';
import 'package:flutter_appbb/Model/CategoryType.dart';
import '../Collection/collectionPage.dart';
import 'package:flutter_appbb/Model/Category.dart';
import 'searchResultPage.dart';
import 'package:http/http.dart' as http;

class ShowAllCategoryPage extends StatefulWidget{
  const ShowAllCategoryPage();

  @override
  ShowAllCategoryPageState createState() => ShowAllCategoryPageState();
}

class ShowAllCategoryPageState extends State<ShowAllCategoryPage> {
  final List<List<Category>> categoryList = [];
  //final List<Category> subcategoryList = [];
  final List<CategoryType> categoryTypeList = [];

  static bool isStartSearching = true;
  bool isCanBack = true;

  static searchingChange(bool value){
    isStartSearching = value;
    print("visibility changed to " + value.toString());
  }

  Future<List<CategoryType>> fetchCategory() async {
    var url = "http://localhost:3000/category-all";
    var response = await http.get(Uri.parse(url));
    print("Response : \n " + response.body);

    List<CategoryType> categorytypes = <CategoryType>[];

    if(response.statusCode == 200){
      var categoryTypesJson = json.decode(response.body);
      for (var categoryTypeJson in categoryTypesJson){
        CategoryType categoryType = CategoryType.fromJson(categoryTypeJson);

        var categoriesJson = categoryTypeJson['categoryList'];
        print("categoryList : \n " + categoriesJson.toString());

        List<Category> categories = <Category>[];
        for (var categoryJson in categoriesJson) {
          categories.add(Category.fromJson(categoryJson));
        }

        categoryType.categoryList = categories;
        categorytypes.add(categoryType);
      }
    }
    return categorytypes;
  }

  @override
  void initState() {
    fetchCategory().then((value){
      setState(() {
        categoryTypeList.addAll(value);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegularAppBar(isFirstPage: false, title: "Semua Kategori Tempat",),
      body: Container(
        //color: Colors.blue,
          child : ListView(
            children: [Expanded(
              child: new ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categoryTypeList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildCategoryTypeList(context, index)
              ),
            ),
            ],
          )
      ),
    );
  }

  Widget buildCategoryTypeList(BuildContext context, int index) {
    final placeCategory = categoryTypeList[index];
    return new Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(children: <Widget>[
                  Text(placeCategory.categoryTypeTitle!, style: new TextStyle(fontSize: 16.0),),
                ]
                ),
              ),
          ), new ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: placeCategory.categoryList!.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildCategoryList(context, index, placeCategory.categoryList!)
              ),
            ],
      ),
    );
  }

  Widget buildCategoryList(BuildContext context, int index, List<Category> categoryList) {
    final category = categoryList[index];
    return new Container(
      child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(children: <Widget>[
                  Text(category.categoryTitle!, style: new TextStyle(fontSize: 16.0),),
                ]
                ),
              ),
            ),
          )
      ),
    );
  }
}