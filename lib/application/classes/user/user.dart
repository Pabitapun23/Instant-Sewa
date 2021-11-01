class User {
  //model = database
  String id;
  String fullName;
  String userName;
  String img;
  String address;
  String phoneNumber;
  String email;
  String job;
  double rating;
  String avatar;

  User.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['identifier'].toString(),
        userName = jsonMap['username'],
        fullName = jsonMap['fullname'],
        img = jsonMap['avatar'],
        address = jsonMap['address'],
        email = jsonMap['email'],
        phoneNumber = jsonMap['phoneno'],
        avatar = jsonMap['avatar'],
        rating = jsonMap['rate'].toDouble(),
        job = jsonMap['occupation'];
}
