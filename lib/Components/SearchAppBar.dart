import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/RoundedInputField.dart';

import '../Explorer/searchResultPage.dart';

class searchAppBar extends StatelessWidget implements PreferredSizeWidget{
  bool? isFirstPage = false;
  double? height = 120;
  final ValueChanged<String>? submitted;
  final TextEditingController? textSearchController;

  searchAppBar({
    Key? key,
    //this.currentKey,
    this.isFirstPage,
    this.submitted,
    this.textSearchController
  }) : super(key: key);

  @override
  Size get preferredSize{
    return new Size.fromHeight(height!);
  }

  @override
  Widget build(BuildContext context) {
    return new PreferredSize(
        preferredSize: new Size.fromHeight(height!),
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
            child: const Text(
              'Accessive',
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
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: RoundedInputField(
                  icon: Icons.search,
                  onSubmitted: submitted,
                  controller: textSearchController,
                ),
              )
          ),
        ),
    );
  }
}
