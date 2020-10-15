
import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/repositories/service_provider_repository.dart';

class ServiceProviderState
{
  final ServiceProviderRepository _serviceProviderRepository;
  ServiceProviderState(this._serviceProviderRepository);
  List<User> _users = [];
  List<User> get providers => _users;
  Future getServiceProviderInformation() async
  {
    _users= await _serviceProviderRepository.getServiceProviderInformation();
  }
}