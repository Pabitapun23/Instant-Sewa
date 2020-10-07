import 'package:instantsewa/model/profile_model.dart';

class ProfilesService {
  List<Profile> addProfile() {
    return [
      new Profile(
        name: "Pabita Pun",
        username: "pabita123",
        img: "https://robohash.org/1?set=set2",
        address: "pokhara",
        phoneNumber: "9809096876",
        email: "pabita123@gmail.com",
      ),
    ];
  }
}
