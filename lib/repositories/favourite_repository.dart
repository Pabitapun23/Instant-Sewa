import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FavouriteRepository {
  Future<List<User>> getAllFavouriteServiceProvider();
}

class FavouriteRepositoryImpl implements FavouriteRepository {
  FavouriteRepositoryImpl();

  @override
  Future<List<User>> getAllFavouriteServiceProvider() async {

    String id;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    id = user['id'].toString();
    String url = '/serviceuser/' + id + '/favourite';
    try {
      final response = await InstantSewaAPI.dio.get(url,
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      List _temp = response.data['data'];
      List<User> _favouriteServiceProvider = _temp
          .map((user) => User.fromJson(user))
          .toList();
      return _favouriteServiceProvider;
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}
