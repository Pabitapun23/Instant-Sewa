import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

abstract class AuthRepository {
  Future signIn({
    @required String email,
    @required String password,
  });
  Future logOut();
  Future signUp({
    @required String username,
    @required String email,
    @required String password,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  void SendDeviceToken(String token) async
  {
    try {
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio
          .post("/deviceTokenUpdate", data: {
        "deviceToken": token
      }, options: Options(headers: {
        'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
      }));
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }
  void FireBase(){
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.getToken().then((token) {
      if(LocalStorage.getItem(TOKEN)!=null) {
        SendDeviceToken(token);
      }
      print(token);
    });
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {},
        onResume: (Map<String, dynamic> message) async {},
        onLaunch: (Map<String, dynamic> message) async {});
  }
  @override
  Future signIn({
    String email,
    String password,
  }) async {
    try {
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio
          .post("/auth/login", data: {"email": email, "password": password});
      String accessToken = response.data['accessToken'];
      String expiresAt = response.data['expiresAt'];
      await LocalStorage.setItem(TOKEN, accessToken);
      await LocalStorage.setItem(TOKEN_EXPIRATION, expiresAt);
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      await localStorage.setString('user', json.encode(response.data['user']));
      var user = jsonDecode(localStorage.getString('user'));
      FireBase();
      if(user['address_address'] != null){
        await LocalStorage.setItem(FUllNAME,user['fullname']);
          await LocalStorage.setItem(PHONE,user['phoneno']);
        await LocalStorage.setItem(USERNAME,user['username']);
        await LocalStorage.setItem(ADDRESS_ADDRESS,user['address_address']);
        await LocalStorage.setItem(ADDRESS_LATITUDE,user['address_latitude'].toString());
        await LocalStorage.setItem(ADDRESS_LONGITUDE,user['address_longitude'].toString());
        Navigator.pushNamed(RM.context, homeRoute);
      }
      else if(user['phoneno'] != null)
        {
          await LocalStorage.setItem(USERNAME,user['username']);
          await LocalStorage.setItem(FUllNAME,user['fullname']);
          await LocalStorage.setItem(PHONE,user['phoneno']);
          Navigator.pushNamed(RM.context, addressUpdateRoute);
        }
      else if(user['fullname'] != null)
      {
        await LocalStorage.setItem(FUllNAME,user['fullname']);
        await LocalStorage.setItem(USERNAME,user['username']);
        Navigator.pushNamed(RM.context, phoneUpdateRoute);
      }
      else
        {await LocalStorage.setItem(USERNAME,user['username']);
          Navigator.pushNamed(RM.context, fullNameUpdateRoute);
        }
      return;
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }

  @override
  Future signUp({
    String username,
    String email,
    String password,
  }) async {
    try {
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio.post(
        "/auth/register",
        data: {
          "email": email,
          "password": password,
          "username": username,
          "user_type": 'serviceuser'
        },
      );
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }

  @override
  Future logOut() async
  {
    try{
      final response = await InstantSewaAPI.dio.get("/auth/logout",options: Options(
          headers: {
            'Authorization':"Bearer ${LocalStorage.getItem(TOKEN)}"
          }
      ));
      if(response.statusCode==200)
        {
          LocalStorage.deleteItem (TOKEN);
          SharedPreferences localStorage = await SharedPreferences.getInstance();
          await localStorage.remove('user');
          LocalStorage.deleteItem(FUllNAME);
          LocalStorage.deleteItem(PHONE);
          LocalStorage.deleteItem(USERNAME);
          LocalStorage.deleteItem(ADDRESS_ADDRESS);
          LocalStorage.deleteItem(ADDRESS_LATITUDE);
          LocalStorage.deleteItem(ADDRESS_LONGITUDE);
        }
    }on DioError catch (e) {
      showNetworkError(e);
    }
  }
}
