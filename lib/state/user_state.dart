
import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/repositories/user_repository.dart';

class UserState
{
  final UserRepository _userRepository;
  UserState(this._userRepository);
  List<User> _users = [];
  List<User> get users => _users;
  Future getUserInformation() async
  {
    _users= await _userRepository.getUserInformation();
  }
}