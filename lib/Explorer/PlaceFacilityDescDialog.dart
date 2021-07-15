import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/RoundedButton.dart';

class PlaceFacilityDescDialog extends StatelessWidget{
  final String? facilityTypeAvailableIcon;
  final String? facilityTypeName;
  final String? facilityTypeDesc;

  const PlaceFacilityDescDialog({
    Key? key,
    this.facilityTypeAvailableIcon,
    this.facilityTypeName,
    this.facilityTypeDesc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.network(
                facilityTypeAvailableIcon!,
                height: 60,
                width: 60,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                facilityTypeName!,
                style: new TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                facilityTypeDesc!,
                style: new TextStyle(fontSize: 14.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              RoundedButton(
                text: "Tutup",
                press: (){
                  Navigator.of(context).pop();
                },
              ),
            ]
        ),
      ),
    );
  }

}