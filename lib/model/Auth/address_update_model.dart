import 'package:geolocator/geolocator.dart';
import 'package:instantsewa/state/service_user_update_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class AddressUpdateModel {
  final ServiceUserUpdateState _serviceUserUpdateState = Injector.get<ServiceUserUpdateState>();
  String address;
  double latitude,longitude;
  void setAddress(String address) {
    this.address = address;
  }
  void setLatLang(Position latLang )
  {
   this.longitude = latLang.longitude;
   this.latitude = latLang.latitude;
  }
  bool validateData() {
    return this.address!= null && this.latitude != null &&this.longitude!= null;
  }
  Future<void> updateAddress() async
  {
    await _serviceUserUpdateState.updateAddress(address: address,longitude: longitude,latitude: latitude);
  }

}

