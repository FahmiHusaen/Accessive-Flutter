import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_appbb/Login/login_screen.dart';
import 'package:flutter_appbb/MainNavigation.dart';
import 'package:flutter_appbb/Signup/signup_screen.dart';
import 'package:flutter_appbb/Welcome/components/background.dart';
import 'package:flutter_appbb/Components/RoundedButton.dart';
import 'package:flutter_appbb/Components/Constants.dart';
import 'package:flutter_appbb/Welcome/WelcomeScreen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_svg/svg.dart';

class Splash extends StatefulWidget{
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {

  startLaunching() async{
    final prefs = await SharedPreferences.getInstance();
    bool loginStatus;
    loginStatus = prefs.getBool('loginStatus') ?? false;

    var duration = new Duration(seconds: 2);
    return new Timer(duration,(){
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return loginStatus ? new MainNavigation() : new LoginScreen();
      }));
    }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startLaunching();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset("assets/logos/accessive-logo.svg",
              width: 250,
              height: 250,
            ),
            SizedBox(height: 20,),
            Text(
              "Accessive.id",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
            SizedBox(height: size.height * 0.05)
          ],
        ),
      ),
    );
  }
}
