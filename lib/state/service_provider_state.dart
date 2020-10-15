
import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/repositories/service_provider_repository.dart';

class ServiceProviderState
{
  final ServiceProviderRepository _serviceProviderRepository;
  ServiceProviderState(this._serviceProviderRepository);
  List<User> _users = [];
  List<User> _provider = [];
  List<User> get providers => _users;
  List<User> get provider => _provider;
  Future getServiceProviderInformation() async
  {
    _users= await _serviceProviderRepository.getServiceProviderInformation();
  }
  Future getServiceProviderDetails(id) async
  {
    _provider= await _serviceProviderRepository.getServiceProviderDetails(id);
  }
}