class User {
  //model = database
  String id;
  String fullName;
  String userName;
  String img;
  String address;
  String phoneNumber;
  String email;

  User.fromJson(Map<String,dynamic> jsonMap):
        id = jsonMap['id'].toString(),
        userName = jsonMap['username'],
        fullName = jsonMap['fullname'],
        img = jsonMap['avatar'],
        address = jsonMap['address'],
        email = jsonMap['email'];

}