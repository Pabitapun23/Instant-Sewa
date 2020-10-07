import 'package:instantsewa/model/profile_model.dart';

class ProfilesService {
  List<Profile> addProfiles() {
    return [
      new Profile(
        name: "Pabita Pun",
        username: "pabita123",
        img: "https://robohash.org/1?set=set2",
        address: "Pokhara",
        phone_number: "9809090307",
        email: "pabita@gmail.com",
      ),
    ];
  }
}
