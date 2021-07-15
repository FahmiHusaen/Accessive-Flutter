import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/SearchAppBar.dart';
import '../DummyData.dart';
import 'RecommendPlaceListItem.dart';
import '../Collection/collectionPage.dart';
import 'package:flutter_appbb/Model/placeCategory.dart';
import 'placeDetailPage.dart';
import 'searchResultPage.dart';

import '../Model/Places.dart';

class explorePage extends StatefulWidget{
  const explorePage();

  @override
  explorePageState createState() => explorePageState();
}

class explorePageState extends State<explorePage> {

  final List<PlaceCategory> placeCategoryList = placeCategoryDummyList;

  final List<Places> placeList = [
    Places("xxx01", "Universitas Gadjah Mada", "Universitas",
        "Bulaksumur, Yogyakarta", "081215747812", "ugm.ac.id"),
    Places("xxx02", "Warunk Upnormal", "Cafe", "Jl. Pandega Marta, Yogyakarta", "081215747812", "ugm.ac.id"),
    Places("xxx03", "Rumah Sakit UGM", "Rumah Sakit",
        "Kronggahan, Gamping, Sleman, Yogyakarta", "081215747812", "ugm.ac.id"),
  ];

  static bool isStartSearching = true;
  bool isCanBack = true;

  //static var searchingChange;

  static searchingChange(bool value){
    isStartSearching = value;
    print("visibility changed to " + value.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(isFirstPage: true,
        submitted: (String value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return searchResultPage();
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => collectionPage()));
                          },),
                        ]
                        ),
                      ),
              ),
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
            ],
          )
        ),
    );
  }

  Widget buildPlaceList(BuildContext context, int index) {
    final places = placeList[index];
    return RecommendPlaceListItem(
        places: places, press: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return placeDetailPage(places);
        //return placeDetailPage();
      }));
    });
  }

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
          onTap: () {},
          child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(children: <Widget>[
                  Text(placeCategory.categoryName!, style: new TextStyle(fontSize: 16.0),),
                ]
          ),
        ),
        ),
        )
      ),
    );
  }



}