import 'package:instantsewa/application/classes/services/service_selection.dart';
import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/application/classes/user/user_by_distance.dart';
import 'package:instantsewa/repositories/service_provider_selection_repository.dart';

class ServiceProviderSelectionState {
  final ServiceProviderSelectionRepository _serviceProviderSelectionRepository;

  ServiceProviderSelectionState(this._serviceProviderSelectionRepository)
      : assert(_serviceProviderSelectionRepository != null);
  List<UserByDistance> _provider = [];
  List<UserByDistance> _favProvider = [];
  List<UserByDistance> _providerByRate = [];
  List<ServiceSelection> _service = [];

  List<UserByDistance> get providers => _provider;
  List<UserByDistance> get favProviders => _favProvider;
  List<UserByDistance> get providerByRates => _providerByRate;
  List<ServiceSelection> get services => _service;
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

  Future getFavServiceProviderInformationByDistance({
    String subCategoryName,
    String latitude,
    String longitude,
    String startTime,
    String endTime,
  }) async {
    _favProvider = await _serviceProviderSelectionRepository
        .getFavServiceProviderInformationByDistance(
            subCategoryName: subCategoryName,
            latitude: latitude,
            longitude: longitude,
            startTime: startTime,
            endTime: endTime);
  }

  Future getTopServiceProviderInformation({
    String subCategoryName,
    String latitude,
    String longitude,
    String startTime,
    String endTime,
  }) async {
    _providerByRate = await _serviceProviderSelectionRepository
        .getTopServiceProviderInformation(
            subCategoryName: subCategoryName,
            latitude: latitude,
            longitude: longitude,
            startTime: startTime,
            endTime: endTime);
  }

  Future getService({String serviceProviderId}) async {
    _service = await _serviceProviderSelectionRepository.getService(
        serviceProviderId: serviceProviderId);
  }
}
