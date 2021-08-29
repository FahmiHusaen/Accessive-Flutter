import 'package:flutter/material.dart';
import 'package:flutter_appbb/Model/Facility.dart';

import 'PlaceFacilityDescDialog.dart';

class BuildPlaceFacilityFilterList extends StatelessWidget{
  final Facility? facility;
  final VoidCallback? onClicked;
  final BuildContext? context;

  const BuildPlaceFacilityFilterList({
    Key? key,
    this.facility,
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
                            value: facility!.isChecked,
                            onChanged: (value) => onClicked!(),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Image.network(
                            facility!.facilityTypeIcon!,
                            height: 60,
                            width: 60,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            facility!.facilityTypeTitle!,
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
                            facilityTypeAvailableIcon: facility!.facilityTypeIcon,
                            facilityTypeName: facility!.facilityTypeTitle,
                            facilityTypeDesc: facility!.facilityTypeDesc,);
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