import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/Constants.dart';
import 'package:flutter_appbb/DummyData.dart';
import 'package:flutter_appbb/Model/Facility.dart';

import '../Model/Places.dart';

class PlaceSearchResultListItem extends StatelessWidget{
  final Place? place;
  final Function? press;
  final bool? isCollection;
  List<Facility>? placeFacilityList;

  PlaceSearchResultListItem({
    Key? key,
    this.place,
    this.press,
    this.isCollection,
    this.placeFacilityList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //placeFacilityList = PlaceFacilityFilterDummyList;
    return new Container(
      child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                press!();
              },
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                children: [
                                  Text(
                                    place!.placeTitle!,
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                  Spacer(),
                                  Text(
                                    "34 Km",
                                    style: new TextStyle(fontSize: 14.0),
                                  )
                                ]
                            ),
                            Text(
                              place!.categoryTitle!,
                              style: new TextStyle(fontSize: 14.0),
                            ),
                            Text(
                              place!.address!,
                              style: new TextStyle(fontSize: 14.0),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(
                                    height: 60,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: placeFacilityList!.length,
                                        itemBuilder: (BuildContext context, int index) =>
                                            buildPlaceFacilityReviewList(context, index, placeFacilityList!)
                                    )
                                )
                              ],
                            ),
                            Visibility(
                              visible: isCollection!,
                            child: Row(
                                children: [
                                  Spacer(),
                                  Icon(
                                    Icons.delete,
                                    color: redCautionColor,
                                  )
                                  ,Text(
                                    "Hapus",
                                    style: new TextStyle(fontSize: 14.0),
                                  )
                                ]
                            ),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          )),
    );
  }

  Widget buildPlaceFacilityReviewList(BuildContext context, index, List<Facility> placeFacilityList) {
    Facility placeFacility = placeFacilityList[index];
    return new Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 5, top: 5),
        child: Row(
            children: <Widget>[
              Image.network(
                placeFacility.facilityTypeIcon!,
                height: 40,
                width: 40,
                fit: BoxFit.fill,
              ),
            ]
        ),
      ),
    );
  }

}