import 'package:flutter/material.dart';
import 'package:instantsewa/model/provider_model.dart';
class ServiceProvidersService {
  List<Provider> addProvider() {
    return [
    new Provider(name: 'Plumbing', image:Image.asset('flag')),
    new Provider(name: 'Electrical', image: Image.asset('flag')),
    new Provider(name: 'Carpentering', image: Image.asset('flag')),
    new Provider(name: 'Painting', image: Image.asset('flag'))
    ];
  }
}