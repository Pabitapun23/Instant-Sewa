class UserByDistance {
  String id;
  String fullName;
  String userName;
  String img;
  String address;
  String phoneNumber;
  String email;
  String job;
  int rating;

  UserByDistance.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['identifier'].toString(),
        userName = jsonMap['username'],
        fullName = jsonMap['fullname'],
        img = jsonMap['avatar'],
        address = jsonMap['address'],
        email = jsonMap['email'],
        phoneNumber = jsonMap['phoneno'],
        rating = jsonMap['rate'],
        job = jsonMap['occupation'][0];
}