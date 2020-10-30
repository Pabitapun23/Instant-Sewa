import 'dart:convert';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  String email;
  String userName;
  String fullName;
  String phoneNumber;
  String address;

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }
  _loadUserData() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if(user != null) {
      setState(() {
        userName = user['username'];
        fullName = LocalStorage.getItem(FUllNAME);
        address = LocalStorage.getItem(ADDRESS);
        email = user['email'];
        phoneNumber = LocalStorage.getItem(PHONE);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final List subtitle = [
      "Email",
      "Address",
      "Phone Number",
    ];
    final List title = [
      email,
      address,
      phoneNumber,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor:Colors.deepPurpleAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 130,
                    color: Colors.grey[200],
                  ),
                  Align(
                    alignment: Alignment(0, 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CircularProfileAvatar(
                          "https://robohash.org/1?set=set2",
                          //backgroundImage: NetworkImage('https://avatars0.githubusercontent.com/u/8264639?s=460&v=4),
                          borderWidth: 4.0,
                          radius: 60.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          fullName,
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          userName,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //TopBar(),
                ],
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14.0,
                        vertical: 12.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(
                          //     icon[index],
                          //     size: 30.0,
                          //     color: Colors.deepPurple,
                          //   ),
                          // ),
                          SizedBox(
                            width: 14.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                title[index],
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                subtitle[index],
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              shrinkWrap: true,
              itemCount: 3,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: RaisedButton(
                  elevation: 10,
                  onPressed: () {},
                  color: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
