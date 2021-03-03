import 'package:instantsewa/state/service_user_update_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class PhoneUpdateModel {
  final ServiceUserUpdateState _serviceUserUpdateState = Injector.get<ServiceUserUpdateState>();
  String phoneNo;
  void setPhoneNo(String phoneNo) {
    this.phoneNo = phoneNo;
  }
  bool validateData() {
    return this.phoneNo!= null
    ;
  }
  Future<void> updatePhoneNo() async
  {
    await _serviceUserUpdateState.updatephoneNo(phoneNo: phoneNo);
  }

}

