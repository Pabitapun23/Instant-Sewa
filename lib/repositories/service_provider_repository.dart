import 'package:dio/dio.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
abstract class ServiceProviderRepository {
  Future<List<User>> getServiceProviderInformation();
  Future<List<User>> getServiceProviderDetails($id);
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
}
