import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/repositories/auth_repository.dart';
import 'package:instantsewa/repositories/category_repository.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/router/router.dart';
import 'package:instantsewa/services/handymans_service.dart';
import 'package:instantsewa/services/service_providers_service.dart';
import 'package:instantsewa/state/auth_state.dart';
import 'package:instantsewa/state/category_state.dart';
import 'package:provider/provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'Store/MyStore.dart';
import 'application/storage/storage_keys.dart';
import 'ui/home_page.dart';
import 'package:instantsewa/providers/categories.dart';

void setup() {
  GetIt.instance.registerSingleton<HandyMansService>(HandyMansService());
  GetIt.instance
      .registerSingleton<ServiceProvidersService>(ServiceProvidersService());
}

void main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initializeSharedPreference();
  runApp(InstantSewa());
}

class InstantSewa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        Inject<AuthState>(() => AuthState(AuthRepositoryImpl())),
        Inject<CategoryState>(() => CategoryState(CategoryRepositoryImpl())),],
      builder: (context) {
        return ChangeNotifierProvider(
          create: (context) {
            return MyStore();
          },
          child: MaterialApp(
            home: HomePage(),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routers.onGenerateRoute,
            initialRoute:LocalStorage.getItem(TOKEN) != null ? homeRoute : loginRoute,
          ),
        );
      },
    );
  }
}
