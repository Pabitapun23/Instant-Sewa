import 'package:dio/dio.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:instantsewa/state/user_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

abstract class UserRepository {
  Future<List<User>> getUserInformation();
}

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<User>> getUserInformation() async {
    final _userStateRM = RM.get<UserState>();
    try{
      final response = await InstantSewaAPI.dio.get("/category",options: Options(
          headers: {
            'Authorization':"Bearer ${LocalStorage.getItem(TOKEN)}"
          }
      ));
      List _temp = response.data;
      List<User> _users = _temp.map((category) => User.fromJson(category)).toList();
      return _users;

    }on DioError catch(e){
      throw showNetworkError(e);
    }
  }
}
