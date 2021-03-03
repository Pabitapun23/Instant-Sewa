import 'package:instantsewa/application/classes/services/service.dart';
import 'package:instantsewa/repositories/service_repository.dart';

class ServiceState {
  final ServiceRepository _serviceRepository;
  ServiceState(this._serviceRepository);
  List<Service> _services = [];
  List<Service> _servicesDetails = [];
  List<Service> get services => _services;
  List<Service> get serviceDetails => _servicesDetails;
  Future getAllServices(id) async {
    _services = await _serviceRepository.getAllServices(id);
  }
  Future getAllServiceDetails(id) async {
    _servicesDetails = await _serviceRepository.getAllServiceDetails(id);
  }
}
