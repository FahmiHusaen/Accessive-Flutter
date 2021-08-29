import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_appbb/Login/components/background.dart';
import 'package:flutter_appbb/MainNavigation.dart';
import 'package:flutter_appbb/Signup/signup_screen.dart';
import 'package:flutter_appbb/Components/AlreadyHaveAnAccountCheck.dart';
import 'package:flutter_appbb/Components/RoundedButton.dart';
import 'package:flutter_appbb/Components/RoundedInputField.dart';
import 'package:flutter_appbb/Components/RoundedPasswordField.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

bool visible = false;
String loginUrl = "http://localhost:3000/login";

class Body extends StatefulWidget{
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  login() async {
    setState(() {
      visible = true;
    });
    final prefs = await SharedPreferences.getInstance();
    var params = "?username=" + userNameController.text +
        "&password=" + passwordController.text;

    try {
      var res = await http.get(Uri.parse(loginUrl + params));
      print("Status : " + res.statusCode.toString());
      print("Response : \n" + res.body.toString());

      if (res.statusCode == 200) {
        var response = json.decode(res.body);
        if (response['loginStatus'] == "OK") {
          prefs.setBool('loginStatus', true);
          setState(() {
            visible = false;
          });

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainNavigation()));
        } else {
          setState(() {
            visible = false;
          });
          _showAlertDialog(context, response['response_message']);
        }
      }
    } catch (e) {}
  }

  _showAlertDialog(BuildContext context, String err) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () => Navigator.pop(context),
    );
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text(err),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Login Accessive.id",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              controller: userNameController,
              icon: Icons.email,
              hintText: "Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: passwordController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Login",
              press: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return MainNavigation();
                  }));

                //login();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
