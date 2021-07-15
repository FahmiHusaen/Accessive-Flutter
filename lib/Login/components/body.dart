import 'package:flutter/material.dart';
import 'package:flutter_appbb/Login/components/background.dart';
import 'package:flutter_appbb/MainNavigation.dart';
import 'package:flutter_appbb/Signup/signup_screen.dart';
import 'package:flutter_appbb/Components/AlreadyHaveAnAccountCheck.dart';
import 'package:flutter_appbb/Components/RoundedButton.dart';
import 'package:flutter_appbb/Components/RoundedInputField.dart';
import 'package:flutter_appbb/Components/RoundedPasswordField.dart';
//import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              icon: Icons.email,
              hintText: "Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
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
