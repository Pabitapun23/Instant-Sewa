import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

abstract class ServiceUserUpdateRepository
{
  Future<bool> updateFullName({@required String fullName,@required String gender});
  Future<bool> employeeCheck({@required String id,@required String category,@required String email});
  Future<bool> updateAddress({@required String address,@required double latitude,@required double longitude});
  Future<bool> updatePhone({@required String phoneNo});
  Future<bool> updateProfile({@required String phoneNo,@required String email,@required String userName,@required String fullName});
}

class ServiceUserUpdateRepositoryImpl implements ServiceUserUpdateRepository
{
  @override
  Future<bool> updateAddress({String address,double latitude,double longitude,})
  async
  {
    try {
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio
          .post("/addressUpdate", data: {
        "address_address": address,
        "address_latitude": latitude,
        "address_longitude":longitude
      }, options: Options(headers: {
        'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
      }));
      await LocalStorage.setItem(ADDRESS_ADDRESS,address);
      await LocalStorage.setItem(ADDRESS_LATITUDE, latitude.toString());
      await LocalStorage.setItem(ADDRESS_LONGITUDE,longitude.toString());
      return true;
    } on DioError catch (e) {
      showNetworkError(e);
      return false;
    }
  }

  @override
  Future<bool> updateFullName({String fullName,String gender})
  async
  {
    try {
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio
          .post("/fullnameUpdate", data: {
        "fullname": fullName,
        'gender': gender,
      }, options: Options(headers: {
        'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
      }));
      await LocalStorage.setItem(FUllNAME,fullName);
      return true;
    } on DioError catch (e) {
      showNetworkError(e);
      return false;
    }
  }

  @override
  Future<bool> updatePhone({String phoneNo}) async
  {
    try {
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio
          .post("/phoneNoUpdate", data: {
        "phoneno": phoneNo
      }, options: Options(headers: {
        'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
      }));
      await LocalStorage.setItem(PHONE,phoneNo);
      return true;
    } on DioError catch (e) {
      showNetworkError(e);
      return false;
    }
  }

  @override
  Future<bool> updateProfile({
    String phoneNo,
    String email,
    String userName,
    String fullName})async
  {
    try {
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio
          .post("/profileupdate", data: {
        "fullName": fullName,
        'userName': userName,
        'email':email,
        'phoneno':phoneNo
      }, options: Options(headers: {
        'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
      }));
        SharedPreferences localStorage = await SharedPreferences.getInstance();
       await localStorage.setString('user', json.encode(response.data['user']));
       var user = jsonDecode(localStorage.getString('user'));
      await LocalStorage.setItem(FUllNAME,user['fullname']);
      await LocalStorage.setItem(PHONE,user['phoneno']);
      await LocalStorage.setItem(USERNAME,user['username']);
      await LocalStorage.setItem(ADDRESS_ADDRESS,user['address_address']);
      await LocalStorage.setItem(ADDRESS_LATITUDE,user['address_latitude'].toString());
      await LocalStorage.setItem(ADDRESS_LONGITUDE,user['address_longitude'].toString());

      return true;
    } on DioError catch (e) {
      showNetworkError(e);
      return false;
    }
  }

  @override
  Future<bool> employeeCheck({String id, String category, String email}) async
  {
    try {
      Color _purple = HexColor('#603f8b');
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio
          .post("/employeeVerify", data: {
        'id': id,
        'email': email,
        'category': category,
      }, options: Options(headers: {
        'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
      }));
      if(response.data["data"] == "false")
        {
          showDialog(
              context: RM.context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Warning!!",
                    style: TextStyle(color: Colors.red),),
                  content:
                  const Text("He is not ServiceProvider. Call the police. Dail 100."),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(
                        "Ok",
                        style: TextStyle(color: _purple),
                      ),
                    ),
                  ],
                );
              }
          );
        }
      else{
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (BuildContext context) => EmployeeCard(),
        //   ),
        // );
      }
return true;
    } on DioError catch (e) {
      showNetworkError(e);
      return false;
    }
  }
}