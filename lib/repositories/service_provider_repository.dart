import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ServiceProviderRepository {
  Future<List<User>> getServiceProviderInformation();
  Future<List<User>> getServiceProviderDetails($id);
  Future setFavouriteServiceProvider({@required String service_provider_id});
  Future<bool> getFavouriteServiceProvider(
      {@required String service_provider_id});
  Future bookServiceProvider({
    @required String serviceId,
    @required String latitude,
    @required String longitude,
    @required String address,
    @required String serviceProviderId,
    @required DateTime startTime,
    @required DateTime endTime,
  });
}

class ServiceProviderRepositoryImpl implements ServiceProviderRepository {
  @override
  Future<List<User>> getServiceProviderInformation() async {
    try {
      final response = await InstantSewaAPI.dio.get("/serviceprovider",
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      List _temp = response.data['data'];
      List<User> _serviceProviders = _temp
          .map((serviceprovider) => User.fromJson(serviceprovider))
          .toList();
      return _serviceProviders;
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }

  @override
  Future<List<User>> getServiceProviderDetails($id) async {
    String url = "/serviceprovider/" + $id;
    try {
      final response = await InstantSewaAPI.dio.get(url,
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      List _temp = response.data['data'];
      List<User> _serviceProviders = _temp
          .map((serviceprovider) => User.fromJson(serviceprovider))
          .toList();
      return _serviceProviders;
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }

  @override
  // ignore: non_constant_identifier_names
  Future setFavouriteServiceProvider({String service_provider_id}) async {
    String id;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    id = user['id'].toString();
    bool result = await getFavouriteServiceProvider(
        service_provider_id: service_provider_id);
    if (!result) {
      try {
        Dio dio = new Dio();
        Response response = await InstantSewaAPI.dio.post("/favourite",
            data: {
              "service_user_id": id,
              "service_provider_id": service_provider_id
            },
            options: Options(headers: {
              'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
            }));
        return true;
      } on DioError catch (e) {
        showNetworkError(e);
      }
    } else {
      try {
        Dio dio = new Dio();
        Response response = await InstantSewaAPI.dio.post("/deleteFavourite",
            data: {
              "service_user_id": id,
              "service_provider_id": service_provider_id
            },
            options: Options(headers: {
              'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
            }));
        return true;
      } on DioError catch (e) {
        showNetworkError(e);
      }
    }
  }

  @override
  // ignore: non_constant_identifier_names
  Future<bool> getFavouriteServiceProvider({String service_provider_id}) async {
    String id;
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var user = jsonDecode(localStorage.getString('user'));
      id = user['id'].toString();
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio.post("/checker",
          data: {
            "service_user_id": id,
            "service_provider_id": service_provider_id
          },
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      if (response.data['data'] == 'true') {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }

  @override
  Future bookServiceProvider({
    String serviceId,
    String latitude,
    String longitude,
    String address,
    String serviceProviderId,
    DateTime startTime,
    DateTime endTime,
  }) async {
    try {
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio.post(
        "/book",
        data: {
          "service_id": serviceId,
          "serviceusers_latitude": latitude,
          "serviceusers_longitude": longitude,
          "serviceusers_address": address,
          "serviceprovider_id": serviceProviderId,
          "startDate": startTime,
          "endDate": endTime
        },
      );
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }
}
