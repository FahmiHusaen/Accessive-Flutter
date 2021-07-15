import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/RegularAppBar.dart';

class ProfileDetailContainer extends StatelessWidget{
  final Widget? child;

  const ProfileDetailContainer({
    Key? key,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.topCenter,
        children:<Widget>[
          Positioned(
            child:
            Container(
              margin: EdgeInsets.only(top: 75, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                  padding : EdgeInsets.only(left: 20, right: 20, top: 115, bottom: 20),
                  child: child
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: SizedBox(
              width: 150,
              height: 150,
              child: CircleAvatar(
                backgroundColor: Colors.brown.shade800,
              ),
            ),
          ),
        ]
    );
  }
}