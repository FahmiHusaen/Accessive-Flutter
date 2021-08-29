import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/RegularAppBar.dart';
import 'package:flutter_appbb/DummyData.dart';
import 'package:flutter_appbb/Explorer/PlaceSearchResultListItem.dart';
import 'package:flutter_appbb/Explorer/placeDetailPage.dart';
import 'package:flutter_appbb/Model/Facility.dart';
import 'package:flutter_appbb/Model/Places.dart';
import 'package:flutter_appbb/Model/Guide.dart';

class collectionPage extends StatelessWidget{

  final List<Place> placeList = placeDummyList;
  List<List<Facility>> placeFacilityList = RealFacilityDummyList;
  List<List<Guide>> placeGuideList = GuideDummyList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: RegularAppBar(title: "Koleksi Tempat", isFirstPage: true,),
        body: SizedBox.expand(
          child: Stack(
            children: <Widget>[
              Container(
                //color: Colors.blue,
                  child: ListView(
                    children: [
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

  Widget buildPlaceList(BuildContext context, int index) {
    final place = placeList[index];
    final facilityList = placeFacilityList[index];
    final guideList = placeGuideList[index];
    return PlaceSearchResultListItem(
        place: place, isCollection: true, placeFacilityList: facilityList, press: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return placeDetailPage(place, facilityList, guideList);
        //return placeDetailPage();
      }));
    });
  }
}