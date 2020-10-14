import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ServiceProviderRepository
{
  Future<List<User>> getServiceProviderInformation();
}
class ServiceProviderRepositoryImpl implements ServiceProviderRepository{

  @override
  Future<List<User>> getServiceProviderInformation() async {
    try{
      final response = await InstantSewaAPI.dio.get("/serviceprovider",options: Options(
          headers: {
            'Authorization':"Bearer ${LocalStorage.getItem(TOKEN)}"
          }
      ));
      print("response");
      List _temp = response.data['data'];
      List<User> _serviceProviders = _temp.map((serviceprovider) => User.fromJson(serviceprovider)).toList();
      return _serviceProviders;

    }on DioError catch(e){
      throw showNetworkError(e);
    }
  }

}