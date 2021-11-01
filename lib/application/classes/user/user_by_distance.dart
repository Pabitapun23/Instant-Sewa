class UserByDistance {
  String id;
  String latitude;
  String userName;
  String longitude;
  String address;
  String distance;
  double rating;
  String avatar;
  UserByDistance.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['identifier'].toString(),
        userName = jsonMap['username'],
        latitude = jsonMap['latitude'].toString(),
        longitude = jsonMap['longitude'].toString(),
        address = jsonMap['address'],
        avatar  = jsonMap['avatar'],
        distance =
            double.parse((jsonMap['distance']).toStringAsFixed(2)).toString(),
        rating = jsonMap['rate'].toDouble();
}
