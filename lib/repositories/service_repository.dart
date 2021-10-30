import 'package:dio/dio.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/services/service.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';

abstract class ServiceRepository {
  Future<List<Service>> getAllServices(id);
  Future<List<Service>> getAllServiceDetails(id);
  Future <List<String>> categoryName();
}

class ServiceRepositoryImpl implements ServiceRepository {
  ServiceRepositoryImpl();

  @override
  Future<List<Service>> getAllServices(id) async {
    String url = '/subcategory/' + id + '/service';
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

  @override
  Future<List<Service>> getAllServiceDetails($id) async {
    String url = "/service/" + $id;
    try {
      final response = await InstantSewaAPI.dio.get(url,
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      List _temp = response.data['data'];
        List<Service> _serviceDetails = _temp
            .map((serviceDetail) => Service.fromJson(serviceDetail))
            .toList();
        print(_serviceDetails);
       return _serviceDetails;
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
  Future <List<String>> categoryName() async {
    try {
      final response = await InstantSewaAPI.dio.get("/categoryName",
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      List _temp = response.data;
      return _temp.cast<String>();
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}

