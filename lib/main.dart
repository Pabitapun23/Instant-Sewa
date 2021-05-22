import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/providers/cart.dart';
import 'package:instantsewa/providers/categories.dart';
import 'package:instantsewa/repositories/auth_repository.dart';
import 'package:instantsewa/repositories/category_repository.dart';
import 'package:instantsewa/repositories/favourite_repository.dart';
import 'package:instantsewa/repositories/rating_repository.dart';
import 'package:instantsewa/repositories/service_provider_repository.dart';
import 'package:instantsewa/repositories/service_provider_selection_repository.dart';
import 'package:instantsewa/repositories/service_repository.dart';
import 'package:instantsewa/repositories/service_user_update_repository.dart';
import 'package:instantsewa/repositories/sub_category_repository.dart';
import 'package:instantsewa/repositories/tracking_repository.dart';
import 'package:instantsewa/repositories/user_repository.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/router/router.dart';
import 'package:instantsewa/services/service_providers_service.dart';
import 'package:instantsewa/state/auth_state.dart';
import 'package:instantsewa/state/category_state.dart';
import 'package:instantsewa/state/favourite_state.dart';
import 'package:instantsewa/state/rating_state.dart';
import 'package:instantsewa/state/service_provider_selection_state.dart';
import 'package:instantsewa/state/service_provider_state.dart';
import 'package:instantsewa/state/service_state.dart';
import 'package:instantsewa/state/service_user_update_state.dart';
import 'package:instantsewa/state/sub_category_state.dart';
import 'package:instantsewa/state/tracking_state.dart';
import 'package:instantsewa/state/user_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'application/InstantSewa_api.dart';
import 'application/classes/errors/common_error.dart';
import 'application/storage/storage_keys.dart';
import 'ui/home_page.dart';
import 'package:dio/dio.dart';
void setup() {
  GetIt.instance
      .registerSingleton<ServiceProvidersService>(ServiceProvidersService());
}
void SendDeviceToken(String token) async
{
  try {
    Dio dio = new Dio();
    Response response = await InstantSewaAPI.dio
        .post("/deviceTokenUpdate", data: {
      "deviceToken": token
    }, options: Options(headers: {
      'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
    }));
  } on DioError catch (e) {
    showNetworkError(e);
  }
}
void FireBase(){
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _firebaseMessaging.subscribeToTopic('all');
  _firebaseMessaging.getToken().then((token) {
    if(LocalStorage.getItem(TOKEN)!=null) {
      SendDeviceToken(token);
    }
    print(token);
  });
  _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {},
      onResume: (Map<String, dynamic> message) async {},
      onLaunch: (Map<String, dynamic> message) async {});
}

Future<void> getPermission() async {
  PermissionStatus permission =
      await PermissionHandler().checkPermissionStatus(PermissionGroup.location);
  if (permission == PermissionStatus.denied) {
    await PermissionHandler()
        .requestPermissions([PermissionGroup.locationAlways]);
  }
}

void main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initializeSharedPreference();
  runApp(InstantSewa());
  FireBase();
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
        Inject<ServiceUserUpdateState>(
            () => ServiceUserUpdateState(ServiceUserUpdateRepositoryImpl())),
        Inject<ServiceProviderSelectionState>(() =>
            ServiceProviderSelectionState(
                ServiceProviderSelectionRepositoryImpl())),
        Inject<TrackingState>(() => TrackingState(TrackingRepositoryImpl())),
        Inject<RatingState>(() => RatingState(RatingRepositoryImpl())),
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
                ? LocalStorage.getItem(FUllNAME) == null
                    ? fullNameUpdateRoute
                    : LocalStorage.getItem(PHONE) == null
                        ? phoneUpdateRoute
                        : LocalStorage.getItem(ADDRESS_ADDRESS) == null
                            ? addressUpdateRoute
                            : homeRoute
                : onBoardingRoute,
          ),
        );
      },
    );
  }
}
