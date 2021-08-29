import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/RoundedButton.dart';
import 'package:flutter_appbb/DummyData.dart';
import 'package:flutter_appbb/Explorer/PlaceFacilityDescDialog.dart';
import '../Model/Facility.dart';
import '../Model/Guide.dart';
import '../Model/Places.dart';

class GuideDetailPage extends StatefulWidget{
  Guide guide;
  GuideDetailPage(this.guide);

  @override
  GuideDetailPageState createState() => GuideDetailPageState();
}

class GuideDetailPageState extends State<GuideDetailPage> {

  static bool isStartSearching = true;
  bool isCanBack = true;
  List<NetworkImage> carouselImageList = [];

  List<String> imageUrls = [];

  @override
  void initState() {
    // TODO: implement initState
    /*
    imageUrls = [
      'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/guide-photos-accessive%2FUGM%2FLayanan%20Informasi%20(2).jpg?alt=media&token=dbf62304-8b08-43f0-8ea6-820350fea330',
      'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/guide-photos-accessive%2FUGM%2FLokasi%20Tempat%20(2).jpg?alt=media&token=55843858-1403-4a71-87c6-b46447f6c095',
    ];
     */

    imageUrls = widget.guide.guidePhotoUrlList;

    setState(() {
      for (var imageUrl in imageUrls){
        carouselImageList.add(NetworkImage(imageUrl));
      }
    });
    super.initState();
  }

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
              icon: const Icon(Icons.menu),
              color: Colors.black,
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              }),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 300.0,
              width: double.infinity,
              child: Carousel(
                images: carouselImageList,
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotColor: Colors.lightGreenAccent,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.grey.withOpacity(0.5),
                //borderRadius: true,
                autoplay: false,
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(widget.guide.guideDesc),
              )
            )
          ],
        ),
      ),
    );
  }
}