import 'package:instantsewa/application/classes/common/Job/job.dart';

class User {
  //model = database
  final String id;
  final String fullName;
  final String userName;
  final String img;
  final String address;
  final String phoneNumber;
  final String email;
  final String job;

  User.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'].toString(),
        userName = jsonMap['username'],
        fullName = jsonMap['fullname'],
        img = jsonMap['avatar'],
        address = jsonMap['address'],
        email = jsonMap['email'],
        phoneNumber = jsonMap['phoneno'],
        job = jsonMap['occupation'][0];
}