import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:instantsewa/providers/cart.dart';
import 'package:instantsewa/services/handymans_service.dart';
import 'package:instantsewa/services/service_providers_service.dart';
import 'package:provider/provider.dart';
import 'ui/home_page.dart';
import 'package:instantsewa/providers/categories.dart';

void setup() {
  GetIt.instance.registerSingleton<HandyMansService>(HandyMansService());
  GetIt.instance
      .registerSingleton<ServiceProvidersService>(ServiceProvidersService());
}

void main() {
  setup();
  runApp(InstantSewa());
}

class InstantSewa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Categories(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
