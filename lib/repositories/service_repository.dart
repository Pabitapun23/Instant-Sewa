import 'package:dio/dio.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/services/service.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';

abstract class ServiceRepository {
  Future<List<Service>> getAllServices(id);
}

class ServiceRepositoryImpl implements ServiceRepository {
  ServiceRepositoryImpl();

  @override
  Future<List<Service>> getAllServices(id) async {
    String url = '/subcategory/' + id + '/service/';
    try {
      final response = await InstantSewaAPI.dio.get(url,
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      List _temp = response.data['data'];
      List<Service> _services =
          _temp.map((service) => Service.fromJson(service)).toList();
      return _services;
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}
