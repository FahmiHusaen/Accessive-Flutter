import 'package:flutter/material.dart';
import 'Collection/collectionPage.dart';
import 'Components/Constants.dart';
import 'Explorer/explorePage.dart';
import 'Explorer/placeDetailPage.dart';
import 'TabNavigatorRoutes.dart';
import 'UserProfile/profilePage.dart';
/// This is the main application widget.

class MainNavigation extends StatelessWidget {
  const MainNavigation({
    Key? key
  }) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _currentPage = "Page1";

  List<String> pageKeys = ["Page1", "Page2", "Page3"];

  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
  };

  GlobalKey<NavigatorState>? _key = GlobalKey();
  GlobalKey<NavigatorState>? _key1 = GlobalKey();
  GlobalKey<NavigatorState>? _key2 = GlobalKey();

  int _selectedIndex = 0;

  void _selectTab(String tabItem, int index) {
    if(tabItem == _currentPage ){
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print("Page index " + _selectedIndex.toString());
    }
    );
  }

  GlobalKey? getKey(int index){
    if(index == 0){
      return _key!;
    } else if (index == 1){
      return _key1!;
    } else if (index == 2){
      return _key2!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
          onWillPop: () async {
            final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
            if (isFirstRouteInCurrentTab) {
              if (_currentPage != "Page1") {
                _selectTab("Page1", 1);

                return false;
              }
            }
            // let system handle back button if we're on the first route
            return isFirstRouteInCurrentTab;
          },
          child: Column(
            children: <Widget>[
              Expanded(
                child:
                Stack(
                    children:<Widget>[
                      _buildOffstageNavigator("Page1"),
                      _buildOffstageNavigator("Page2"),
                      _buildOffstageNavigator("Page3"),
                    ]
                ),
              ),
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Jelajahi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Koleksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        onTap: (int index) { _selectTab(pageKeys[index], index); },
      ),
    );
  }


  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }

}