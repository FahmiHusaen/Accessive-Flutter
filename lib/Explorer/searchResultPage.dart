import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/SearchAppBar.dart';
import 'package:flutter_appbb/Explorer/BuildCategoryFilterList.dart';
import 'package:flutter_appbb/Explorer/SlideUpFilterPanelContainer.dart';
import 'package:flutter_appbb/Model/PlaceFacility.dart';
import 'package:flutter_appbb/Model/placeCategory.dart';
import 'BuildPlaceFacilityFilterList.dart';
import 'placeDetailPage.dart';
import 'PlaceSearchResultListItem.dart';
import '../Model/Places.dart';
import 'package:flutter_appbb/DummyData.dart';

class searchResultPage extends StatefulWidget{
  const searchResultPage();

  @override
  searchResultPageState createState() {
    return new searchResultPageState();
  }
}

class searchResultPageState extends State<searchResultPage> {

  final List<Places> placeList = [
    Places("xxx01", "Universitas Gadjah Mada", "Universitas",
        "Bulaksumur, Yogyakarta", "081215747812", "ugm.ac.id"),
    Places("xxx02", "Warunk Upnormal", "Cafe", "Jl. Pandega Marta, Yogyakarta", "081215747812", "ugm.ac.id"),
    Places("xxx03", "Rumah Sakit UGM", "Rumah Sakit",
        "Kronggahan, Gamping, Sleman, Yogyakarta", "081215747812", "ugm.ac.id"),
  ];

  List<PlaceFacility> PlaceFacilityFilterList = PlaceFacilityFilterDummyList;

  List<PlaceCategory> placeCategoryList = placeCategoryDummyList;

  double searchRadius = 10;

  bool isSortByRelevance = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(isFirstPage: false),
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            Container(
              //color: Colors.blue,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                onTap: () {
                                  showFilterPanel();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text("Filter", style: new TextStyle(fontSize: 16.0),),
                                        SizedBox(width: 5,),
                                        Icon(Icons.settings)
                                      ]
                                  ),
                                ),
                              ),
                            )
                        )
                      ],
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
                )),
          ],
        ),
      )
    );
  }

  void showFilterPanel(){
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true, // set this to true
      builder: (_) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState /*You can rename this!*/)
        {
          return SlideUpFilterPanelContainer(
            context: context,
            title: "Filter",
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Fasilitas Tempat',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    onTap: () {
                      showPlaceFacilityFilterPanel();
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Kategori Tempat',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    onTap: () {
                      showPlaceCategoryFilterPanel();
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Radius Pencarian : ' + searchRadius.toString() + ' Km',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Slider(
                    value: searchRadius,
                    onChanged: (newSearchRadius) {
                      setState(() {
                        searchRadius = newSearchRadius;
                      });
                    },
                    divisions: 95,
                    min: 5,
                    max: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Urutan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Checkbox(
                          value: isSortByRelevance,
                          onChanged: (value) =>
                              setState(() {
                                final newValue = !isSortByRelevance;
                                isSortByRelevance = newValue;
                              }),
                        ),
                        Text(
                          'Relevansi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      setState(() {
                        final newValue = !isSortByRelevance;
                        isSortByRelevance = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Checkbox(
                          value: !isSortByRelevance,
                          onChanged: (value) =>
                              setState(() {
                                final newValue = !isSortByRelevance;
                                isSortByRelevance = newValue;
                              }),
                        ),
                        Text(
                          'Jarak Terdekat',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      setState(() {
                        final newValue = !isSortByRelevance;
                        isSortByRelevance = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  void showPlaceFacilityFilterPanel(){
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true, // set this to true
      builder: (_) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
          return SlideUpFilterPanelContainer(
            context: context,
            title: "Pilih Jenis Fasilitas Tempat",
            child: Expanded(
            child: new ListView.builder(
                shrinkWrap: true,
                //physics: const NeverScrollableScrollPhysics(),
                itemCount: PlaceFacilityFilterList.length,
                itemBuilder: (BuildContext context, int index) =>
                    BuildPlaceFacilityFilterList(
                      placeFacility: PlaceFacilityFilterList[index], context: context,
                      onClicked: () {
                        setState(() {
                          final newValue = !PlaceFacilityFilterList[index].isChecked;
                          PlaceFacilityFilterList[index].isChecked = newValue;
                        });
                      },)
            ),
          )
          );
        });
      },
    );
  }

  Widget buildPlaceList(BuildContext context, int index) {
    final places = placeList[index];
    return PlaceSearchResultListItem(
        places: places, isCollection: false, press: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return placeDetailPage(places);
            //return placeDetailPage();
          }));
    });
  }

  void showPlaceCategoryFilterPanel(){
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true, // set this to true
      builder: (_) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
              return SlideUpFilterPanelContainer(
                  context: context,
                  title: "Pilih Jenis Fasilitas Tempat",
                  child: Expanded(
                    child: new ListView.builder(
                        shrinkWrap: true,
                        //physics: const NeverScrollableScrollPhysics(),
                        itemCount: placeCategoryList.length,
                        itemBuilder: (BuildContext context, int index) =>
                            BuildCategoryFilterList(
                              placeCategory: placeCategoryList[index], context: context,
                              onClicked: () {
                                setState(() {
                                  final newValue = !placeCategoryList[index].isChecked;
                                  placeCategoryList[index].isChecked = newValue;
                                });
                              },)
                    ),
                  )
              );
            });
      },
    );
  }

}
