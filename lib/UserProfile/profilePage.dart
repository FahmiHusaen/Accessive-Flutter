import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/RegularAppBar.dart';
import 'package:flutter_appbb/UserProfile/ProfileDetailContainer.dart';
import 'package:flutter_appbb/UserProfile/profileEditPage.dart';
import 'package:flutter_appbb/Welcome/welcome_screen.dart';

class profilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  regularAppBar(title: "Profil Pengguna", isFirstPage: true),
      body: Column(
          children: <Widget>[
            ProfileDetailContainer(
                child: Container(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Bima Indra P", style: new TextStyle(fontSize: 18.0),),
                              ]
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(children: <Widget>[
                            Expanded(
                                  flex: 4,
                                  child: Text("Email", style: new TextStyle(fontSize: 16.0),),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text("bimaxxx@gmail.com", style: new TextStyle(fontSize: 16.0),),
                                ),
                              ]
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 4,
                                      child: Text("Telefon", style: new TextStyle(fontSize: 16.0),),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Text("081215747812", style: new TextStyle(fontSize: 16.0),),
                                    ),
                                  ]
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 4,
                                      child: Text("Alamat", style: new TextStyle(fontSize: 16.0),),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Text("Bulaksumur, Caturtunggal, Depok, Sleman, Daerah Istimewa Yogyakarta 55281", style: new TextStyle(fontSize: 16.0),),
                                    ),
                                  ]
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  children: <Widget>[
                                    Spacer(),
                                    InkWell(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.edit),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("Edit Profil", style: new TextStyle(fontSize: 16.0),)
                                        ],
                                      ),
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => profileEditPage()));
                                      },
                                    ),
                                  ]
                              ),
                            ]
                        )
                  ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding : EdgeInsets.all(20),
                child: Container(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                              children: <Widget>[
                                Icon(Icons.settings),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Pengaturan Preferensi Fasilitas", style: new TextStyle(fontSize: 16.0),),
                              ]
                          ),
                          SizedBox(
                            height: 10,
                          ),
                      InkWell(
                        child: Row(
                            children: <Widget>[
                              Icon(Icons.outbond),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Keluar", style: new TextStyle(fontSize: 16.0),),
                            ]
                        ),
                        onTap: (){
                          Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => new WelcomeScreen()));
                        },
                      ),
                    ]
                )
            ),
          ),
        ),
    ])
    );
  }
}