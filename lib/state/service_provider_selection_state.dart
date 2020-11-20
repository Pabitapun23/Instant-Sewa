import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/application/classes/user/user_by_distance.dart';
import 'package:instantsewa/repositories/service_provider_repository.dart';
import 'package:instantsewa/repositories/service_provider_selection_repository.dart';
import 'package:instantsewa/ui/service_provider_selection.dart';

class ServiceProviderSelectionState {
  final ServiceProviderSelectionRepository _serviceProviderSelectionRepository;

  ServiceProviderSelectionState(this._serviceProviderSelectionRepository)
      : assert(_serviceProviderSelectionRepository != null);
  List<UserByDistance> _provider = [];

  List<UserByDistance> get providers => _provider;

  // ignore: non_constant_identifier_names

  Future getServiceProviderInformationByDistance({
    String subCategoryName,
    String latitude,
    String longitude,
    String startTime,
    String endTime,
  }) async {
    _provider = await _serviceProviderSelectionRepository
        .getServiceProviderInformationByDistance(
            subCategoryName: subCategoryName,
            latitude: latitude,
            longitude: longitude,
            startTime: startTime,
            endTime: endTime);
  }
}
