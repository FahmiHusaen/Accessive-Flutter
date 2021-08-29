import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/RoundedButton.dart';
import 'package:flutter_appbb/Components/SearchAppBar.dart';
import 'package:flutter_appbb/Explorer/BuildCategoryFilterList.dart';
import 'package:flutter_appbb/Explorer/SlideUpFilterPanelContainer.dart';
import 'package:flutter_appbb/Model/Facility.dart';
import 'package:flutter_appbb/Model/Category.dart';
import 'package:flutter_appbb/Model/Guide.dart';
import 'BuildPlaceFacilityFilterList.dart';
import 'placeDetailPage.dart';
import 'PlaceSearchResultListItem.dart';
import '../Model/Places.dart';
import 'package:flutter_appbb/DummyData.dart';
import 'package:http/http.dart' as http;

class searchResultPage extends StatefulWidget{
  final String? initSearchQuery;
  final String? initCategoryCode;

  const searchResultPage({
    Key? key,
    this.initSearchQuery,
    this.initCategoryCode
  }) : super(key: key);

  @override
  searchResultPageState createState() {
    return new searchResultPageState();
  }
}

class searchResultPageState extends State<searchResultPage> {

  //List<Place> placeList = placeDummyList;
  List<Place> placeList = [];
  List<Facility> facilityFilterList = PlaceFacilityFilterDummyList;
  //List<Category> categoryFilterList = placeCategoryDummyList;
  List<Category> categoryFilterList = [];
  List<List<Facility>> placeFacilityList = [];
  List<List<Guide>> placeGuideList = [];

  Future<List<Place>> fetchPlaces(String param) async {
    placeList = [];
    var url = "http://localhost:3000/search?";
    url = url + param;
    print("Final url " + url);
    var response = await http.get(Uri.parse(url));
    print("Response : \n " + response.body);

    List<Place> places = <Place>[];

    if(response.statusCode == 200){
      var placesJson = json.decode(response.body);
      for (var placeJson in placesJson){
        places.add(Place.fromJson(placeJson));
      }
    }
    return places;
  }

  Future<List<Category>> fetchCategories() async {
    var url = "http://localhost:3000/category-all-filter";
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
    // TODO: implement initState
    placeList = placeDummyList;
    categoryFilterList = placeCategoryDummyList;
    placeFacilityList = RealFacilityDummyList;
    placeGuideList = GuideDummyList;

    /*
    fetchCategories().then((value){
      setState(() {
        categoryFilterList.addAll(value);

        if(widget.initCategoryCode != null){
          for (var i in categoryFilterList){
            if(widget.initCategoryCode == i.categoryCode){
              i.isChecked = true;
            }
          }
        }

        print("Category filter list : " + categoryFilterList.length.toString());

        newSubCategoryFilterList = categoryFilterList;

        String newParam = generateParam();

        fetchPlaces(newParam).then((value){
          setState(() {
            placeList.addAll(value);
          });
        });

      });
    });
     */

    if(widget.initSearchQuery != null){
      searchQuery = widget.initSearchQuery!;
    }




    super.initState();
  }
  List<Facility> newFacilityFilterList = [];
  List<Category> newCategoryFilterList = [];

  List<Facility> newSubFacilityFilterList = [];
  List<Category> newSubCategoryFilterList = [];

  double searchRadius = 10;
  bool isSortByRelevance = true;

  String searchQuery = "";

  double newSearchRadius = 0;
  bool newIsSortByRelevance = false;

  final TextEditingController textSearchController = TextEditingController();

  void createNewCategoryFilterList(){
    newCategoryFilterList = categoryFilterList.map((item) => new Category.clone(item)).toList();
  }

  void applyCategoryFilterList(){
    categoryFilterList = newCategoryFilterList.map((item) => new Category.clone(item)).toList();
  }

  void createNewSubCategoryFilterList(){
    newSubCategoryFilterList = newCategoryFilterList.map((item) => new Category.clone(item)).toList();
  }

  void applySubCategoryFilterList(){
    newCategoryFilterList = newSubCategoryFilterList.map((item) => new Category.clone(item)).toList();
  }

  void createNewFacilityFilterList(){
    newFacilityFilterList = facilityFilterList.map((item) => new Facility.clone(item)).toList();
  }

  void applyFacilityFilterList(){
    facilityFilterList = newFacilityFilterList.map((item) => new Facility.clone(item)).toList();
  }

  void createNewSubFacilityFilterList(){
    newSubFacilityFilterList = newFacilityFilterList.map((item) => new Facility.clone(item)).toList();
  }

  void applySubFacilityFilterList(){
    newFacilityFilterList = newSubFacilityFilterList.map((item) => new Facility.clone(item)).toList();
  }

  void createNewMainFilterList(){
    newSearchRadius = searchRadius;
    newIsSortByRelevance = isSortByRelevance;
  }

  void applyMainFilterList(){
    searchRadius = newSearchRadius;
    isSortByRelevance = newIsSortByRelevance;
  }

  String generateParam(){
    String param = "";

    param = param + "&q=" + searchQuery;

    param = param + "&radius=" + searchRadius.toString();

    param = param + "&sortByRelevance=" + isSortByRelevance.toString();

    String facilityParam = "";
    var iterate = 0;
    var checkNum = 0;
    for (var i in facilityFilterList){
      if(i.isChecked){
        checkNum++;
        if(iterate>0){
          facilityParam = facilityParam + "%";
        }
        facilityParam = facilityParam + i.facilityTypeCode!;
        checkNum++;
      }
      iterate++;
    }
    if(checkNum>0){
      param = param + "&facility=" + facilityParam;
    }

    iterate = 0;
    checkNum = 0;
    String categoryParam = "";
    for (var i in categoryFilterList){
      if(i.isChecked){
        print("checked");
        if(iterate>0){
          categoryParam = categoryParam + "%";
        }
        categoryParam = categoryParam + i.categoryCode!;
        checkNum++;
      }
      iterate++;
    }
    if(checkNum>0){
      param = param + "&category=" + categoryParam;
    }

    print(param);
    return param;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(
        isFirstPage: false,
        textSearchController: textSearchController,
        submitted: (value){
          searchQuery = value;
          String newParam = generateParam();

          fetchPlaces(newParam).then((placeValue){
            setState(() {
              placeList.addAll(placeValue);
            });
          });
        },
      ),
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
                                  setState(() {
                                    createNewFacilityFilterList();
                                    createNewCategoryFilterList();
                                    createNewMainFilterList();
                                  });
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
            saveButtonTitle: "Terapkan",
            onSaveTap: (){
              applyMainFilterList();
              applyCategoryFilterList();
              applyFacilityFilterList();
              //generateParam();
              Navigator.pop(context);
            },
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
                      createNewSubFacilityFilterList();
                      showFacilityFilterPanel();
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
                      createNewSubCategoryFilterList();
                      showCategoryFilterPanel();
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Radius Pencarian : ' + newSearchRadius.toString() + ' Km',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Slider(
                    value: newSearchRadius,
                    onChanged: (value) {
                      setState(() {
                        newSearchRadius = value;
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
                          value: newIsSortByRelevance,
                          onChanged: (value) =>
                              setState(() {
                                final newValue = !newIsSortByRelevance;
                                newIsSortByRelevance = newValue;
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
                        final newValue = !newIsSortByRelevance;
                        newIsSortByRelevance = newValue;
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
                          value: !newIsSortByRelevance,
                          onChanged: (value) =>
                              setState(() {
                                final newValue = !newIsSortByRelevance;
                                newIsSortByRelevance = newValue;
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
                        final newValue = !newIsSortByRelevance;
                        newIsSortByRelevance = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  void showFacilityFilterPanel(){
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
              saveButtonTitle: "Simpan",
              onSaveTap: (){
              applySubFacilityFilterList();
              Navigator.pop(context);
              },
            child: Expanded(
            child: new ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: newSubFacilityFilterList.length,
                itemBuilder: (BuildContext context, int index) =>
                    BuildPlaceFacilityFilterList(
                      facility: newSubFacilityFilterList[index], context: context,
                      onClicked: () {
                        setState(() {
                          final newValue = !newSubFacilityFilterList[index].isChecked;
                          newSubFacilityFilterList[index].isChecked = newValue;
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
    final place = placeList[index];
    final facilityList = placeFacilityList[index];
    final guideList = placeGuideList[index];
    return PlaceSearchResultListItem(
        place: place, isCollection: false, placeFacilityList: facilityList, press: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return placeDetailPage(place, facilityList, guideList);
            //return placeDetailPage();
          }));
    });
  }

  void showCategoryFilterPanel(){
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true, // set this to true
      builder: (_) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
              return SlideUpFilterPanelContainer(
                  context: context,
                  title: "Pilih Kategori Tempat",
                  saveButtonTitle: "Simpan",
                  onSaveTap: (){
                    applySubCategoryFilterList();
                    Navigator.pop(context);
                  },
                  child: Expanded(
                    child: new ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: newSubCategoryFilterList.length,
                        itemBuilder: (BuildContext context, int index) =>
                            BuildCategoryFilterList(
                              placeCategory: newSubCategoryFilterList[index], context: context,
                              onClicked: () {
                                setState(() {
                                  final newValue = !newSubCategoryFilterList[index].isChecked;
                                  newSubCategoryFilterList[index].isChecked = newValue;
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
