import 'package:instantsewa/state/service_user_update_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class FullNameUpdateModel {
  final ServiceUserUpdateState _serviceUserUpdateState = Injector.get<ServiceUserUpdateState>();
  String fullname;
  void setFullName(String fullname) {
    this.fullname = fullname.allInCaps.capitalizeFirstofEach;
  }
  bool validateData() {
    return this.fullname!= null
    ;
  }
  Future<void> updateFullName() async
  {
    await _serviceUserUpdateState.updateFullName(fullName: fullname);
  }

}
extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toLowerCase();
  String get capitalizeFirstofEach => this.split(" ").map((str) => str.inCaps).join(" ");
}

