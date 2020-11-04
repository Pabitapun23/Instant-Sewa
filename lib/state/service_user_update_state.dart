import 'package:instantsewa/repositories/service_user_update_repository.dart';

class ServiceUserUpdateState
{
  final ServiceUserUpdateRepository _serviceUserUpdateRepository;
  ServiceUserUpdateState(this._serviceUserUpdateRepository):assert(_serviceUserUpdateRepository!=null);
  Future<bool> updateAddress({String address})
  async
  {
    if(await _serviceUserUpdateRepository.updateAddress(address: address))
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
}