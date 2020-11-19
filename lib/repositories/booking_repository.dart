import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

abstract class BookingRepository {


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

class BookingRepositoryImpl implements BookingRepository {
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
          "service_id":serviceId,
          "serviceusers_latitude":latitude,
          "serviceusers_longitude":longitude,
          "serviceusers_address":address,
          "serviceprovider_id":serviceProviderId,
          "startDate":startTime,
          "endDate":endTime
        },
      );
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }

}
