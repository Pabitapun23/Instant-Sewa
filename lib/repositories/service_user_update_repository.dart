import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ServiceUserUpdateRepository
{
  Future<bool> updateFullName({@required String fullName});
  Future<bool> updateAddress({@required String address});
  Future<bool> updatePhone({@required String phoneNo});
}

class ServiceUserUpdateRepositoryImpl implements ServiceUserUpdateRepository
{
  @override
  Future<bool> updateAddress({String address})
  async
  {
    String id;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    id = user['id'].toString();
    try {
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio
          .post("/addressUpdate", data: {
        "id": id,
        "address": address
      }, options: Options(headers: {
        'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
      }));
      await LocalStorage.setItem(ADDRESS,address);
      return true;
    } on DioError catch (e) {
      showNetworkError(e);
      return false;
    }
  }

  @override
  Future<bool> updateFullName({String fullName}) async
  {
    String id;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    id = user['id'].toString();
    try {
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio
          .post("/fullnameUpdate", data: {
        "id": id,
        "fullname": fullName
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
    String id;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    id = user['id'].toString();
    try {
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio
          .post("/phoneNoUpdate", data: {
        "id": id,
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

}