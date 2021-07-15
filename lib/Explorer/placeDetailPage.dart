import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/RoundedButton.dart';
import 'package:flutter_appbb/Explorer/PlaceFacilityDescDialog.dart';
import '../Model/PlaceFacility.dart';
import '../Model/PlaceGuide.dart';
import '../Model/Places.dart';

class placeDetailPage extends StatefulWidget{
  final Places currentPlaces;
  placeDetailPage(this.currentPlaces);

  //final Places currentPlaces = new Places("xxx01", "Universitas Gadjah Mada", "Universitas",
    //  "Bulaksumur, Yogyakarta", "081215747812", "ugm.ac.id");

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

  final List<PlaceGuide> placeGuideList = [
    PlaceGuide("xxx01", "Pintu Masuk",
        "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FRamp%20Icon.png?alt=media&token=b2b20116-2dac-4f08-b193-7e0cc982b740"),
    PlaceGuide("xxx02", "Lihat Sekitar",
        "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FElevator%20Icon.png?alt=media&token=52e9f3ad-e55a-4631-9737-a274d29371b5"),
    PlaceGuide("xxx01", "Pintu Masuk",
        "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FRamp%20Icon.png?alt=media&token=b2b20116-2dac-4f08-b193-7e0cc982b740"),
    PlaceGuide("xxx02", "Lihat Sekitar",
        "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FElevator%20Icon.png?alt=media&token=52e9f3ad-e55a-4631-9737-a274d29371b5"),
  ];

  @override
  placeDetailPageState createState() => placeDetailPageState();
}

class placeDetailPageState extends State<placeDetailPage> {

  static bool isStartSearching = true;
  bool isCanBack = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.black,
          onPressed: (){
              Navigator.of(context).pop();
          },
        ),
        title: Center(
          child: const Text(
            'Accessive',
            style: TextStyle(color: Colors.black),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.black,
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              }),
        ],
      ),
        body: SingleChildScrollView(
          //color: Colors.blue,
          child : Padding(
        padding: const EdgeInsets.all(0.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  PreferredSize(
                    preferredSize: new Size.fromHeight(50.0),
                    child: Image.network(
                        'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/06/12/3931191184.jpg',
                        height: 200,
                        width: double.infinity,
                        fit:BoxFit.fitWidth),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.currentPlaces.placeName,
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          widget.currentPlaces.categoryName,
                          style: new TextStyle(fontSize: 12.0),
                        ),
                      SizedBox (
                        height: 5.0,
                      ),
                      Text(
                          "Alamat : " + widget.currentPlaces.address,
                          style: new TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Telefon : " + widget.currentPlaces.phone,
                          style: new TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Website : " + widget.currentPlaces.website,
                          style: new TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                         Expanded(
                        child: InkWell(
                          child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.add_circle_outline_sharp,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Tambah ke Koleksi",
                              style: new TextStyle(fontSize: 14.0),
                            )
                          ],
                        ),
                          onTap: (){
                          },),
                        ),
                        Expanded(
                            child: InkWell(
                              child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.location_on_outlined,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Lihat di Peta",
                                  style: new TextStyle(fontSize: 14.0),
                                )
                              ],
                            ),
                        onTap: (){},),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding (
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Container(
                color: Colors.white,
                    child: Column(
                      children: [ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                              child: Text("Fasilitas Tempat Tersedia",
                                  style: new TextStyle(fontSize: 16.0)),),
                            Expanded(
                              child: new ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: widget.placeFacilityList.length,
                                  itemBuilder: (BuildContext context, int index) =>
                                      buildPlaceFacilityList(context, index)
                              ),
                            ),
                          ],
                      ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
            ),

            Padding (
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: Text("Panduan Tempat",
                              style: new TextStyle(fontSize: 16.0)),),
                        Expanded(
                          child: new ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.placeGuideList.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  buildPlaceGuideList(context, index)
                          ),
                        ),
                      ],
                    ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
            ),
          ]),
          ),
        ),
    );
  }

  Widget buildPlaceFacilityList(BuildContext context, int index) {
    final placeFacility = widget.placeFacilityList[index];
    return new Container(
      child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: InkWell (
              child: Row(
              children: <Widget>[
                Image.network(
                  placeFacility.facilityTypeAvailableIcon!,
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  placeFacility.facilityTypeName!,
                  style: new TextStyle(fontSize: 16.0),
                ),
                Spacer(),
                Icon(Icons.info_outline)
              ]
          ),
          onTap: (){
            showDialog(
              builder: (context) {
                return PlaceFacilityDescDialog(
                  facilityTypeAvailableIcon: placeFacility.facilityTypeAvailableIcon,
                  facilityTypeName: placeFacility.facilityTypeName,
                  facilityTypeDesc: placeFacility.facilityTypeDesc,);
              }, context: context,
            );
          },)
      ),
    );
  }

  Widget buildPlaceGuideList(BuildContext context, int index) {
    final placeGuide = widget.placeGuideList[index];
    return new Container(
      child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
              children: <Widget>[
                Image.network(
                  placeGuide.guideTypeIcon,
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  placeGuide.guideTypeName,
                  style: new TextStyle(fontSize: 16.0),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios)
              ]
          )
      ),
    );
  }
}