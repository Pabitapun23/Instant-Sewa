import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/repositories/service_provider_repository.dart';

class ServiceProviderState
{
  final ServiceProviderRepository _serviceProviderRepository;
  ServiceProviderState(this._serviceProviderRepository);
  List<User> _serviceProvider = [];
  List<User> get serviceProvider => _serviceProvider;
  Future getServiceProviderInformation() async
  {
    _serviceProvider = await _serviceProviderRepository.getServiceProviderInformation();
  }
}
