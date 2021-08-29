import 'package:flutter/material.dart';
import 'package:flutter_appbb/DummyData.dart';
import 'package:flutter_appbb/Model/Facility.dart';

import '../Model/Places.dart';

class RecommendPlaceListItem extends StatelessWidget{
  final Place? place;
  final Function? press;

  List<Facility> placeFacilityList = PlaceFacilityFilterDummyList;

  RecommendPlaceListItem({
    Key? key,
    this.place,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: PreferredSize(
                          preferredSize: new Size.fromHeight(100.0),
                          child: Image.network(
                              'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/06/12/3931191184.jpg'),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
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
                                      height: 40,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: placeFacilityList.length,
                                          itemBuilder: (BuildContext context, int index) =>
                                              buildPlaceFacilityReviewList(context, index, placeFacilityList)
                                      )
                                  )
                                ],
                              )
                            ],
                          )
                      )
                    ]
                ),
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

