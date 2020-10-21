class ServiceDetails {
  String serviceId;
  String serviceName;
  String serviceImage;
  String serviceDescription;
  String serviceQuantity;
  String servicePrice;

  ServiceDetails.fromJson(Map<String, dynamic> jsonMap)
      : serviceId = jsonMap['id'].toString(),
        serviceName = jsonMap['name'],
        serviceImage = jsonMap['image'],
        serviceDescription = jsonMap['description'],
        serviceQuantity = jsonMap['quantity'].toString(),
        servicePrice = jsonMap['payment'].toString();
}
