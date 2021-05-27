import 'dart:convert';
import 'dart:io';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:instantsewa/base_url.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/ui/Auth/login_page.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  String email;
  String userName;
  String fullName;
  String phoneNumber;
  String address;
  bool _isLoading = false;

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        userName = user['username'];
        fullName = LocalStorage.getItem(FUllNAME);
        address = LocalStorage.getItem(ADDRESS_ADDRESS);
        email = user['email'];
        phoneNumber = LocalStorage.getItem(PHONE);
        _isLoading = true;
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
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: _purple,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, homeRoute);
          },
        ),
      ),
      body:
      (!_isLoading) ? new Center(
        child: new SizedBox(
          height: 50.0,
          width: 50.0,
          child: new CircularProgressIndicator(
            value: null,
            strokeWidth: 7.0,
          ),
        ),
      )
          :
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 130,
                    width: 2000,
                    color: Colors.grey[300],
                    child:
                    Image(
                      image: AssetImage("images/instant_sewa.png"),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        imageProfile(),
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
                child: SizedBox(
                  height: 45.0,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.4,
                  child: RaisedButton(
                    color: _purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    onPressed: () {
                      logout();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 12.0),
                      child: Text(
                        'LogOut',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 17.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            //"https://robohash.org/1?set=set2"
            backgroundImage: _imageFile == null
            ? AssetImage("images/instant_sewa.png")
            : FileImage(File(_imageFile.path)),
            radius: 70.0,
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.deepPurple,
                size: 28.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: 100.0,
      //width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile Picture",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  void logout() async
  {
    try {
      var token = LocalStorage.getItem(TOKEN);
      final response = await http.get(BASE_URL + "/auth/logout", headers:
      {'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        LocalStorage.deleteItem(TOKEN);
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        await localStorage.remove('user');
        LocalStorage.deleteItem(PHONE);
        LocalStorage.deleteItem(FUllNAME);
        LocalStorage.deleteItem(ADDRESS_ADDRESS);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => LoginPage()));
      }
    }
    on DioError catch (e) {
      showNetworkError(e);
    }
  }
}