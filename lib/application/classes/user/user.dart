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
  // String rating;

  User.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['identifier'].toString(),
        userName = jsonMap['username'],
        fullName = jsonMap['fullname'],
        img = jsonMap['avatar'],
        address = jsonMap['address'],
        email = jsonMap['email'],
        phoneNumber = jsonMap['phoneno'],
        //rating = double.parse(jsonMap['rate']).toStringAsFixed(1).toString(),
        job = jsonMap['occupation'];
}
