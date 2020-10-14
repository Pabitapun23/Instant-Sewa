import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserRepository
{
  Future<List<User>> getUserInformation();
}
class UserRepositoryImpl implements UserRepository{

  @override
  Future<List<User>> getUserInformation() async {
    try{
      final response = await InstantSewaAPI.dio.get("/auth/user",options: Options(
          headers: {
            'Authorization':"Bearer ${LocalStorage.getItem(TOKEN)}"
          }
      ));
      print(response);
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('user', json.encode(response.data['data']));
      List<User> _user;
      return _user;
    }on DioError catch(e){
      throw showNetworkError(e);
    }
  }

}