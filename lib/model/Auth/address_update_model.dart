import 'package:instantsewa/state/service_user_update_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class AddressUpdateModel {
  final ServiceUserUpdateState _serviceUserUpdateState = Injector.get<ServiceUserUpdateState>();
  String address;
  void setAddress(String address) {
    this.address = address;
  }
  bool validateData() {
    return this.address!= null
    ;
  }
  Future<void> updateAddress() async
  {
    await _serviceUserUpdateState.updateAddress(address: address);
  }

}

