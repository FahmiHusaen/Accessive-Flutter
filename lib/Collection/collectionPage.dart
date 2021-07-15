import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/RegularAppBar.dart';
import 'package:flutter_appbb/Explorer/PlaceSearchResultListItem.dart';
import 'package:flutter_appbb/Explorer/placeDetailPage.dart';
import 'package:flutter_appbb/Model/Places.dart';

class collectionPage extends StatelessWidget{

  final List<Places> placeList = [
    Places("xxx01", "Universitas Gadjah Mada", "Universitas",
        "Bulaksumur, Yogyakarta", "081215747812", "ugm.ac.id"),
    Places("xxx02", "Warunk Upnormal", "Cafe", "Jl. Pandega Marta, Yogyakarta", "081215747812", "ugm.ac.id"),
    Places("xxx03", "Rumah Sakit UGM", "Rumah Sakit",
        "Kronggahan, Gamping, Sleman, Yogyakarta", "081215747812", "ugm.ac.id"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: regularAppBar(title: "Koleksi Tempat", isFirstPage: true,),
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
    final places = placeList[index];
    return PlaceSearchResultListItem(
        places: places, isCollection: true, press: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return placeDetailPage(places);
        //return placeDetailPage();
      }));
    });
  }
}