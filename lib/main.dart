import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/providers/cart.dart';
import 'package:instantsewa/providers/categories.dart';
import 'package:instantsewa/repositories/auth_repository.dart';
import 'package:instantsewa/repositories/category_repository.dart';
import 'package:instantsewa/repositories/favourite_repository.dart';
import 'package:instantsewa/repositories/service_provider_repository.dart';
import 'package:instantsewa/repositories/service_repository.dart';
import 'package:instantsewa/repositories/sub_category_repository.dart';
import 'package:instantsewa/repositories/user_repository.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/router/router.dart';
import 'package:instantsewa/services/service_providers_service.dart';
import 'package:instantsewa/state/auth_state.dart';
import 'package:instantsewa/state/category_state.dart';
import 'package:instantsewa/state/favourite_state.dart';
import 'package:instantsewa/state/service_provider_state.dart';
import 'package:instantsewa/state/service_state.dart';
import 'package:instantsewa/state/sub_category_state.dart';
import 'package:instantsewa/state/user_state.dart';
import 'package:provider/provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'application/storage/storage_keys.dart';
import 'ui/home_page.dart';

void setup() {
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
        Inject<CategoryState>(() => CategoryState(CategoryRepositoryImpl())),
        Inject<SubCategoryState>(
            () => SubCategoryState(SubCategoryRepositoryImpl())),
        Inject<UserState>(() => UserState(UserRepositoryImpl())),
        Inject<ServiceProviderState>(
            () => ServiceProviderState(ServiceProviderRepositoryImpl())),
        Inject<ServiceState>(() => ServiceState(ServiceRepositoryImpl())),
        Inject<FavouriteState>(() => FavouriteState(FavouriteRepositoryImpl())),
      ],
      builder: (context) {
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
            onGenerateRoute: Routers.onGenerateRoute,
            initialRoute: LocalStorage.getItem(TOKEN) != null
                ? homeRoute
                : onBoardingRoute,
          ),
        );
      },
    );
  }
}
