import 'package:dio/dio.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/servicedetails/service_details.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';

abstract class ServiceDetailsRepository {
  Future<List<ServiceDetails>> getAllServiceDetails(id);
}

class ServiceDetailsRepositoryImpl implements ServiceDetailsRepository {
  ServiceDetailsRepositoryImpl();

  @override
  Future<List<ServiceDetails>> getAllServiceDetails(id) async {
    print(id);
    String url = '/service/' + id;
    try {
      final response = await InstantSewaAPI.dio.get(url,
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      print(response);
      List _temp = response.data['data'];
      List<ServiceDetails> _serviceDetails = _temp
          .map((serviceDetails) => ServiceDetails.fromJson(serviceDetails))
          .toList();

      return _serviceDetails;
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}
