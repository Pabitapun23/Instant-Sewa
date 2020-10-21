class ServiceDetails {
  String serviceId;
  String serviceName;
  String serviceImage;
  String serviceDescription;
  String serviceQuantity;
  String servicePrice;

  ServiceDetails.fromJson(Map<String, dynamic> jsonMap)
      : serviceId = jsonMap['identifier'].toString(),
        serviceName = jsonMap['title'],
        serviceImage = jsonMap['picture'],
        serviceDescription = jsonMap['details'],
        serviceQuantity = jsonMap['time_need'].toString(),
        servicePrice = jsonMap['price'].toString();
}
