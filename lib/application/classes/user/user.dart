class User {
  //model = database
  int id;
  String fullName;
  String userName;
  String img;
  String address;
  String phoneNumber;
  String email;
  String job;

  User.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['identifier'],
        userName = jsonMap['username'],
        fullName = jsonMap['fullname'],
        img = jsonMap['avatar'],
        address = jsonMap['address'],
        email = jsonMap['email'],
        phoneNumber = jsonMap['phoneno'],
        job = jsonMap['occupation'][0];
}
