import 'package:instantsewa/repositories/service_user_update_repository.dart';

class ServiceUserUpdateState
{
  final ServiceUserUpdateRepository _serviceUserUpdateRepository;
  ServiceUserUpdateState(this._serviceUserUpdateRepository):assert(_serviceUserUpdateRepository!=null);
  Future<bool> updateAddress({String address,double latitude,double longitude})
  async
  {
    if(await _serviceUserUpdateRepository.updateAddress(address: address,latitude:latitude,longitude: longitude))
      {
        return true;
      }
    else{
      return false;
    }
  }
  Future<bool> updateFullName({String fullName,String gender})
  async
  {
    if(await _serviceUserUpdateRepository.updateFullName(fullName: fullName,gender: gender)){
      return true;
    }
    else{
      return false;
    }
  }
  Future<bool> employeeVerify({String email,String id, String category})
  async
  {
    if(await _serviceUserUpdateRepository.employeeCheck(id: id,category: category,email: email)){
      return true;
    }
    else{
      return false;
    }
  }
  Future<bool> updatephoneNo({String phoneNo})
  async
  {
    if(await _serviceUserUpdateRepository.updatePhone(phoneNo: phoneNo)){
      return true;
    }
    else{
      return false;
    }
  }
  Future<bool> updateProfile({ String phoneNo,
    String email,
    String userName,
    String fullName})
  async
  {

    if(await _serviceUserUpdateRepository.updateProfile(phoneNo: phoneNo,
        email: email,
        userName: userName,
        fullName: fullName)){
      return true;
    }
    else{
      return false;
    }
  }
  Future<bool> feedbackToSystem({String feedback})async{
    if(await _serviceUserUpdateRepository.feedbackToSystem(feedback: feedback)){
      return true;
    }
    return false;
  }
}