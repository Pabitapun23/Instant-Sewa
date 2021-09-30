import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/state/service_user_update_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
class EmployeeVerifyModel {
  final ServiceUserUpdateState _serviceUserUpdateState = Injector.get<ServiceUserUpdateState>();
  String email;
  String category;
  String id;
  EmployeeVerifyModel({this.category,this.email,this.id});
  void setId(String id) {
    this.id = id;
  }
  void setEmail(String email) {
    if (!validateEmail(email)) {
      throw CommonError(message: "Invalide Email");
    }
    this.email = email.allInCaps;
  }
  void setCategory(String category) {
    this.category = category;

  }

  bool validateData()
  {
    return this.category!= null &&
        this.email != null &&
        this.id != null
    ;
  }

  bool validateEmail(String email)
  {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
  void checkEmployee() async
  {
    await _serviceUserUpdateState.employeeVerify(email: this.email,id: this.id, category: this.category);
  }

}
extension CapExtension on String
{
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toLowerCase();
  String get capitalizeFirstofEach => this.split(" ").map((str) => str.inCaps).join(" ");
}
