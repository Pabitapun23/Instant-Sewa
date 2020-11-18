import 'package:instantsewa/application/classes/user/user_by_distance.dart';
import 'package:instantsewa/repositories/service_provider_selection_repository.dart';


class ServiceProviderSelectionState
{
  final ServiceProviderSelectionRepository _serviceProviderSelectionRepository;
  ServiceProviderSelectionState(this._serviceProviderSelectionRepository): assert(_serviceProviderSelectionRepository != null);
  List<UserByDistance> _users = [];
  List<UserByDistance> get providers => _users;
  // ignore: non_constant_identifier_names
  Future getServiceProviderInformationByDistance({
    String subCategoryName,
    String latitude,
    String longitude,
    DateTime startTime,
    DateTime endTime
  }) async
  {
    await _serviceProviderSelectionRepository.getServiceProviderInformationByDistance(
      subCategoryName: subCategoryName,
      latitude: latitude,
      longitude: longitude,
      startTime: startTime,
      endTime: endTime,
    );
  }
}