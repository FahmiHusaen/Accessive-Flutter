import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/Constants.dart';
import 'package:flutter_appbb/Model/PlaceFacility.dart';

import '../Model/Places.dart';

class PlaceSearchResultListItem extends StatelessWidget{
  final Places? places;
  final Function? press;
  final bool? isCollection;

  List<PlaceFacility> placeFacilityList = [
    PlaceFacility(placeFacilityId: "xxx01", facilityTypeName: "Ramp",
        facilityTypeAvailableIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FRamp%20Icon.png?alt=media&token=b2b20116-2dac-4f08-b193-7e0cc982b740",
        facilityTypeDesc: "Derajat bidang miring 30 derajat dengan lebar minimal 750 mm"),
    PlaceFacility(placeFacilityId: "xxx02", facilityTypeName: "Elevator",
        facilityTypeAvailableIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FElevator%20Icon.png?alt=media&token=52e9f3ad-e55a-4631-9737-a274d29371b5",
        facilityTypeDesc: "Ruang manuver 150 x 150 cm"),
    PlaceFacility(placeFacilityId: "xxx01", facilityTypeName: "Toilet Aksesibel",
        facilityTypeAvailableIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FRamp%20Icon.png?alt=media&token=b2b20116-2dac-4f08-b193-7e0cc982b740",
        facilityTypeDesc: "Toilet yang dapat diakses dengan akses tanpa tangga dan ruang manuver 150cm x 150cm. Lebar bukaan pintu minimal 75cm. Ruang transfer dengan rel dropdown tersedia dan rel pegangan yang dipasang di dinding di kedua sisi toilet."
    ),
    PlaceFacility(placeFacilityId: "xxx02", facilityTypeName: "Tampat Parkir",
        facilityTypeAvailableIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FElevator%20Icon.png?alt=media&token=52e9f3ad-e55a-4631-9737-a274d29371b5",
        facilityTypeDesc: "Parkir dalam, memiliki kapasitas beberapa kendaraan roda 4 / memiliki tanda biru khusus disabilitas."
    ),
  ];

  PlaceSearchResultListItem({
    Key? key,
    this.places,
    this.press,
    this.isCollection
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
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                children: [
                                  Text(
                                    places!.placeName,
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
                              places!.categoryName,
                              style: new TextStyle(fontSize: 14.0),
                            ),
                            Text(
                              places!.address,
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
                                        itemCount: placeFacilityList.length,
                                        itemBuilder: (BuildContext context, int index) =>
                                            buildPlaceFacilityReviewList(context, index, placeFacilityList)
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

  Widget buildPlaceFacilityReviewList(BuildContext context, index, List<PlaceFacility> placeFacilityList) {
    PlaceFacility placeFacility = placeFacilityList[index];
    return new Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 5, top: 5),
        child: Row(
            children: <Widget>[
              Image.network(
                placeFacility.facilityTypeAvailableIcon!,
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