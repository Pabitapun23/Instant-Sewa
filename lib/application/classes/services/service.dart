class Service {
  String serviceId;
  String serviceName;
  String serviceImage;
  String servicePrice;

  Service.fromJson(Map<String, dynamic> jsonMap)
      : serviceId = jsonMap['identifier'].toString(),
        serviceName = jsonMap['title'],
        serviceImage = jsonMap['picture'],
        servicePrice = jsonMap['price'].toString();
}
