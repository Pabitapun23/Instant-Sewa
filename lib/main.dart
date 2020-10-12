import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:instantsewa/repositories/auth_repository.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/router/router.dart';
import 'package:instantsewa/services/handymans_service.dart';
import 'package:instantsewa/services/service_providers_service.dart';
import 'package:instantsewa/state/auth_state.dart';
import 'package:provider/provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'Store/MyStore.dart';
import 'ui/home_page.dart';

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
    return Injector(
      inject: [Inject<AuthState>(()=>AuthState(AuthRepositoryImpl()))],
        builder:(context){
      return ChangeNotifierProvider(
        create: (context) {
          return MyStore();
        },
        child: MaterialApp(
          home: HomePage(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute:Routers.onGenerateRoute,
          initialRoute: homeRoute,
        ),
      );
    },);
  }
}

