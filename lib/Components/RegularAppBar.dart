

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Explorer/searchResultPage.dart';

class regularAppBar extends StatelessWidget implements PreferredSizeWidget{
  String? title;
  bool? isFirstPage = false;
  double height = 60;

  regularAppBar({
    Key? key,
    this.title,
    this.isFirstPage,
  }) : super(key: key);

  @override
  Size get preferredSize{
    return new Size.fromHeight(height);
  }

  @override
  Widget build(BuildContext context) {
    return new PreferredSize(
        preferredSize: new Size.fromHeight(height),
      child:AppBar(
          leading: IconButton(
            icon: Visibility(
              child: Icon(Icons.arrow_back_outlined),
              visible: !isFirstPage!,
            ),
            color: Colors.black,
            onPressed: (){
              if(!isFirstPage!) {
                Navigator.of(context).pop();
              }
            },
          ),
          title: Center(
            child: Text(
              title!,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.justify,
            ),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
             IconButton(
                icon: Visibility(
                    visible: false,
                    child: const Icon(Icons.menu)),
                color: Colors.black,
                onPressed: (){
                }),
          ],
        ),
    );
  }
}
