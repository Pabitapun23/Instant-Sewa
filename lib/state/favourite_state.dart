import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/repositories/favourite_repository.dart';

class FavouriteState
{
  final FavouriteRepository _favouriteRepository;
  FavouriteState(this._favouriteRepository): assert( _favouriteRepository!= null);

  List<User> _users = [];
  List<User> get providers => _users;
  Future getAllFavouriteServiceProvider() async
  {
    _users= await _favouriteRepository.getAllFavouriteServiceProvider();
  }
}