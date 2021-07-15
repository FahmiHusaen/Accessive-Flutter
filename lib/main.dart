import 'package:flutter/material.dart';
import 'MainNavigation.dart';
import 'Welcome/welcome_screen.dart';


void main() => runApp(
    AccessiveApp()
  //const welcome_screen()
);

class AccessiveApp extends StatelessWidget {

  static const String _title = 'Accessive';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MainNavigation()
      //placeDetailPage()
        //WelcomeScreen()
      ,
      debugShowCheckedModeBanner: false,
    );
  }
}
