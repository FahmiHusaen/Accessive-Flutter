import 'package:flutter/material.dart';
import 'package:flutter_appbb/Model/placeCategory.dart';

class BuildCategoryFilterList extends StatelessWidget{
  final PlaceCategory? placeCategory;
  final VoidCallback? onClicked;
  final BuildContext? context;

  const BuildCategoryFilterList({
    Key? key,
    this.placeCategory,
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
                            value: placeCategory!.isChecked,
                            onChanged: (value) => onClicked!(),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            placeCategory!.categoryName!,
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
                ]
            ),)
      ),
    );
  }
}