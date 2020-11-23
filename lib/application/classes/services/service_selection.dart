import 'package:instantsewa/application/classes/services/service.dart';

class ServiceSelection
{
  String subCategoryId;
  String subCategoryName;
  Service service;
ServiceSelection.fromJson(Map<String, dynamic> jsonMap):
      subCategoryId = jsonMap['identifier'],
      subCategoryName =  jsonMap['categoryName'],
      service = Service.fromJson(jsonMap['serviceList']);
}