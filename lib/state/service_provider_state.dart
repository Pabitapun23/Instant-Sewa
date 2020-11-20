import 'package:flutter/cupertino.dart';
import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/repositories/service_provider_repository.dart';

class ServiceProviderState {
  final ServiceProviderRepository _serviceProviderRepository;
  ServiceProviderState(this._serviceProviderRepository)
      : assert(_serviceProviderRepository != null);
  List<User> _users = [];
  List<User> _provider = [];
  List<User> get providers => _users;
  List<User> get provider => _provider;
  // ignore: non_constant_identifier_names
  Future setFavouriteServiceProvider({String $service_provider_id}) async {
    await _serviceProviderRepository.setFavouriteServiceProvider(
        service_provider_id: $service_provider_id);
  }

  // ignore: non_constant_identifier_names
  Future<bool> getFavouriteServiceProvider({String service_provider_id}) async {
    return await _serviceProviderRepository.getFavouriteServiceProvider(
        service_provider_id: service_provider_id);
  }

  Future getServiceProviderInformation() async {
    _users = await _serviceProviderRepository.getServiceProviderInformation();
  }

  Future getServiceProviderDetails(id) async {
    _provider = await _serviceProviderRepository.getServiceProviderDetails(id);
  }

  Future bookServiceProvider({
    @required String serviceId,
    @required String latitude,
    @required String longitude,
    @required String address,
    @required String serviceProviderId,
    @required DateTime startTime,
    @required DateTime endTime,
  }) async {
    await _serviceProviderRepository.bookServiceProvider(
        serviceId: serviceId,
        latitude: latitude,
        longitude: longitude,
        address: address,
        serviceProviderId: serviceProviderId,
        startTime: startTime,
        endTime: endTime);
  }
}
