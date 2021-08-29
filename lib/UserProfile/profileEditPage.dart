import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/RegularAppBar.dart';
import 'package:flutter_appbb/Components/RoundedInputField.dart';
import 'package:flutter_appbb/UserProfile/ProfileDetailContainer.dart';

class profileEditPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  RegularAppBar(title: "Profil Pengguna", isFirstPage: false),
      body: Column(
          children: <Widget>[
            ProfileDetailContainer(
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  child: Text("Ubah Foto Profil", style: new TextStyle(fontSize: 16.0),),
                                )
                              ]
                          ),
                          SizedBox(
                            height: 20,
                          ),
                            Text("Email", style: new TextStyle(fontSize: 16.0),),
                            RoundedInputField(
                              onChanged: (value) {},
                            ),
                              SizedBox(
                                height: 10,
                              ),
                          Text("Telefon", style: new TextStyle(fontSize: 16.0),),
                          RoundedInputField(
                            onChanged: (value) {},
                          ),
                              SizedBox(
                                height: 10,
                              ),
                          Text("Alamat", style: new TextStyle(fontSize: 16.0),),
                          RoundedInputField(
                            onChanged: (value) {},
                          ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  children: <Widget>[
                                    Spacer(),
                                    InkWell(
                                      child: Row(
                                        children: [
                                          Icon(Icons.save),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("Selesai", style: new TextStyle(fontSize: 16.0),),
                                        ],
                                      ),
                                      onTap: (){
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ]
                              ),
                            ]
                        )
                  ),
            ),
    ])
    );
  }
}