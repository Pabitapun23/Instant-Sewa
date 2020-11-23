import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/classes/services/service_selection.dart';
import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/application/classes/user/user_by_distance.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
abstract class ServiceProviderSelectionRepository {
  Future<List<UserByDistance>> getServiceProviderInformationByDistance({
    @required String subCategoryName,
    @required String latitude,
    @required String longitude,
    @required String startTime,
    @required String endTime,
  });
  Future<List<ServiceSelection>> getService({ @required String serviceProviderId});
}
class ServiceProviderSelectionRepositoryImpl implements ServiceProviderSelectionRepository {
  @override
  Future<List<UserByDistance>> getServiceProviderInformationByDistance({
    String subCategoryName,
    String latitude,
    String longitude,
    String startTime,
    String endTime,
  }) async{
      try {
        Response response = await InstantSewaAPI.dio
            .post("/serviceproviderselectionbydistance", data: {
          "subcategories_name": subCategoryName,
          "serviceusers_latitude": latitude,
          "serviceusers_longitude":longitude,
          "startDate":startTime,
          "endDate":endTime,
        }, options: Options(headers: {
          'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
        }));
      List _temp = response.data['data'];
      List<UserByDistance> _serviceProviders = _temp
          .map((serviceprovider) => UserByDistance.fromJson(serviceprovider))
          .toList();
      return _serviceProviders;
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
  @override
  Future<List<ServiceSelection>> getService({
    String serviceProviderId
  }) async{
    try {
      Response response = await InstantSewaAPI.dio
          .post("/serviceselection", data: {
        "service_provider_id": serviceProviderId,
      }, options: Options(headers: {
        'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
      }));
      List _temp = response.data['data'];
      List<ServiceSelection> _service = _temp
          .map((service) => ServiceSelection.fromJson(service))
          .toList();
      return _service;
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}
