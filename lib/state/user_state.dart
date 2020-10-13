
import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/repositories/user_repository.dart';

class UserState
{
  final UserRepository _userRepository;
  UserState(this._userRepository);
  List<User> _profile = [];
  List<User> get profile => _profile;
  Future getUserInformation() async
  {
    _profile= await _userRepository.getUserInformation();
  }
}