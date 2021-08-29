import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/RoundedButton.dart';
import 'package:flutter_appbb/DummyData.dart';
import 'package:flutter_appbb/Explorer/PlaceFacilityDescDialog.dart';
import '../Model/Facility.dart';
import '../Model/Guide.dart';
import '../Model/Places.dart';
import 'GuideDetailPage.dart';

class placeDetailPage extends StatefulWidget{
  final Place currentPlace;
  List<Facility> placeFacilityList;
  List<Guide> placeGuideList;
  placeDetailPage(this.currentPlace, this.placeFacilityList, this.placeGuideList);

  //final Places currentPlaces = new Places("xxx01", "Universitas Gadjah Mada", "Universitas",
    //  "Bulaksumur, Yogyakarta", "081215747812", "ugm.ac.id");

  @override
  placeDetailPageState createState() => placeDetailPageState();
}

class placeDetailPageState extends State<placeDetailPage> {

  static bool isStartSearching = true;
  bool isCanBack = true;

  @override
  Widget build(BuildContext context) {
    //widget.placeFacilityList = PlaceFacilityFilterDummyList;
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
            icon: Visibility(
                visible: false,
                child: const Icon(Icons.menu)),
            color: Colors.black,
            onPressed: (){
              /*
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
                 */
            },
          )
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
                        widget.currentPlace.coverPhotoUrl!,
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
                          widget.currentPlace.placeTitle!,
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          widget.currentPlace.categoryTitle!,
                          style: new TextStyle(fontSize: 12.0),
                        ),
                      SizedBox (
                        height: 5.0,
                      ),
                      Text(
                          "Alamat : " + widget.currentPlace.address!,
                          style: new TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.currentPlace.phone != null ? "Telefon : " + widget.currentPlace.phone! : "Telefon : -",
                          style: new TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.currentPlace.website != null ? "Website : " + widget.currentPlace.website! : "Website : -",
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
                              "Tambah Koleksi",
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
                  placeFacility.facilityTypeIcon!,
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  placeFacility.facilityTypeTitle!,
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
                  facilityTypeAvailableIcon: placeFacility.facilityTypeIcon,
                  facilityTypeName: placeFacility.facilityTypeTitle,
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
          child: InkWell(
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
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GuideDetailPage(placeGuide);
                //return placeDetailPage();
              }));
            },
          )
      ),
    );
  }
}