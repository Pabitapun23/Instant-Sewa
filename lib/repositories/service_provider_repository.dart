import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
abstract class ServiceProviderRepository {
  Future<List<User>> getServiceProviderInformation();
  Future<List<User>> getServiceProviderDetails($id);
  Future setFavouriteServiceProvider({
    @required String $service_provider_id});
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
  Future setFavouriteServiceProvider({String $service_provider_id}) async
  {
    try {
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio
          .post("/favourite", data: {"service_user_id":2,"service_provider_id":$service_provider_id}, options: Options(headers: {
        'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
      }));
           return true;
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }

}
