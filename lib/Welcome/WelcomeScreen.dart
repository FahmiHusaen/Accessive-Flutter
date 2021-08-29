import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/Constants.dart';
import 'package:flutter_appbb/Components/RoundedButton.dart';
import 'package:flutter_appbb/Login/login_screen.dart';
import 'package:flutter_appbb/Signup/signup_screen.dart';
import 'package:flutter_appbb/Welcome/components/background.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Selamat Datang di Accessive.id",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "Login",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                text: "Sign Up",
                color: kPrimaryLightColor,
                textColor: Colors.black,
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
      ),
    );
  }
}
