import 'package:flutter/material.dart';
import 'package:flutter_appbb/Collection/collectionPage.dart';
import 'package:flutter_appbb/Explorer/explorePage.dart';
import 'package:flutter_appbb/UserProfile/profilePage.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final String? tabItem;

  @override
  Widget build(BuildContext context) {

    Widget? child;
    if(tabItem == "Page1")
      child = explorePage();
    else if(tabItem == "Page2")
      child = collectionPage();
    else if(tabItem == "Page3")
      child = profilePage();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => child!
        );
      },
    );
  }
}
