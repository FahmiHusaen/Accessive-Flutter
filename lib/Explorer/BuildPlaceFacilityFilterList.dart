import 'package:flutter/material.dart';
import 'package:flutter_appbb/Model/PlaceFacility.dart';

import 'PlaceFacilityDescDialog.dart';

class BuildPlaceFacilityFilterList extends StatelessWidget{
  final PlaceFacility? placeFacility;
  final VoidCallback? onClicked;
  final BuildContext? context;

  const BuildPlaceFacilityFilterList({
    Key? key,
    this.placeFacility,
    this.onClicked,
    this.context
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      key: UniqueKey(),
      child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: InkWell (
            child: Row(
                children: <Widget>[
                  Expanded(
                    child:
                    InkWell(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: placeFacility!.isChecked,
                            onChanged: (value) => onClicked!(),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Image.network(
                            placeFacility!.facilityTypeAvailableIcon!,
                            height: 60,
                            width: 60,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            placeFacility!.facilityTypeName!,
                            style: new TextStyle(fontSize: 16.0),
                          ),
                          Spacer(),
                        ],
                      ),
                      onTap: (){
                        onClicked!();
                      },
                    ),
                  ),
                  InkWell(
                    child: Icon(Icons.info_outline),
                    onTap: (){
                      showDialog(
                        builder: (context) {
                          return PlaceFacilityDescDialog(
                            facilityTypeAvailableIcon: placeFacility!.facilityTypeAvailableIcon,
                            facilityTypeName: placeFacility!.facilityTypeName,
                            facilityTypeDesc: placeFacility!.facilityTypeDesc,);
                        }, context: context,
                      );
                    },
                  )
                ]
            ),)
      ),
    );
  }

}