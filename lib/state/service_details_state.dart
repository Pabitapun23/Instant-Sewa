import 'package:instantsewa/application/classes/servicedetails/service_details.dart';
import 'package:instantsewa/repositories/service_details_repository.dart';

class ServiceDetailsState {
  final ServiceDetailsRepository _serviceDetailsRepository;
  ServiceDetailsState(this._serviceDetailsRepository);
  List<ServiceDetails> _serviceDetails = [];
  List<ServiceDetails> get serviceDetails => _serviceDetails;
  Future getAllServiceDetails(id) async {
    _serviceDetails = await _serviceDetailsRepository.getAllServiceDetails(id);
  }
}
