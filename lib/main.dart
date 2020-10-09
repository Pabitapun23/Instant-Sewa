import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
//import 'package:instantsewa/model/profile_model.dart';
import 'package:instantsewa/services/handymans_service.dart';
import 'package:instantsewa/services/profiles_service.dart';
import 'package:instantsewa/services/service_providers_service.dart';
import 'package:provider/provider.dart';

import 'Store/MyStore.dart';
import 'ui/home_page.dart';

void setup() {
  GetIt.instance.registerSingleton<HandyMansService>(HandyMansService());
  GetIt.instance
      .registerSingleton<ServiceProvidersService>(ServiceProvidersService());
}

void main() {
  setup();
  runApp(
    ChangeNotifierProvider(
      //register data stored
      create: (context) {
        return MyStore();
      },
      child: MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
