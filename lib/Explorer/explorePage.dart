import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/SearchAppBar.dart';
import 'package:flutter_appbb/Explorer/ShowAllCategoryPage.dart';
import '../DummyData.dart';
import 'RecommendPlaceListItem.dart';
import '../Collection/collectionPage.dart';
import 'package:flutter_appbb/Model/Category.dart';
import 'placeDetailPage.dart';
import 'searchResultPage.dart';
import 'package:http/http.dart' as http;

import '../Model/Places.dart';

class explorePage extends StatefulWidget{
  const explorePage();

  @override
  explorePageState createState() => explorePageState();
}

class explorePageState extends State<explorePage> {

  //final List<Category> placeCategoryList = placeCategoryDummyList;
  List<Category> placeCategoryList = [];

  //final List<Place> placeList = placeDummyList;

  static bool isStartSearching = true;
  bool isCanBack = true;

  //static var searchingChange;

  static searchingChange(bool value){
    isStartSearching = value;
    print("visibility changed to " + value.toString());
  }

  Future<List<Category>> fetchCategory() async {
    var url = "http://localhost:3000/category-home";
    var response = await http.get(Uri.parse(url));
    print("Response : \n " + response.body);

    List<Category> categories = <Category>[];

    if(response.statusCode == 200){
      var categoriesJson = json.decode(response.body);
      for (var categoryJson in categoriesJson){
        categories.add(Category.fromJson(categoryJson));
      }
    }
    return categories;
  }

  @override
  void initState() {
    /*
    fetchCategory().then((value){
      setState(() {
        placeCategoryList.addAll(value);
      });
    });
     */
    placeCategoryList = placeCategoryDummyList;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(isFirstPage: true,
        submitted: (String value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return searchResultPage(initSearchQuery: value,);
          }));
        },),
          body: Container(
          //color: Colors.blue,
          child : ListView(
            children: [Expanded(
              child: new ListView.builder(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: placeCategoryList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildPlaceCategoryList(context, index)
              ),
            ),
              Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(children: <Widget>[
                          InkWell(child: Text("Lainnya", style: new TextStyle(fontSize: 16.0)),
                          onTap: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => ShowAllCategoryPage()));
                          },),
                        ]
                        ),
                      ),
              ),
              /*
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Rekomendasi Tempat", style: new TextStyle(fontSize: 16.0)),
                  ),
                ),
              Expanded(
                child: new ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: placeList.length,
                    itemBuilder: (BuildContext context, int index) =>
                        buildPlaceList(context, index)),
              ),
               */
            ],
          )
        ),
    );
  }

  /*
  Widget buildPlaceList(BuildContext context, int index) {
    final place = placeList[index];
    return RecommendPlaceListItem(
        place: place, press: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return placeDetailPage(place);
        //return placeDetailPage();
      }));
    });
  }
   */

  Widget buildPlaceCategoryList(BuildContext context, int index) {
    final placeCategory = placeCategoryList[index];
    return new Container(
        child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return searchResultPage(initCategoryCode: placeCategory.categoryCode,);
            }));
          },
          child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(children: <Widget>[
                  Text(placeCategory.categoryTitle!, style: new TextStyle(fontSize: 16.0),),
                ]
          ),
        ),
        ),
        )
      ),
    );
  }
}