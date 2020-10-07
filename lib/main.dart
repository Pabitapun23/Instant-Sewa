import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:instantsewa/model/profile_model.dart';
import 'package:instantsewa/services/handymans_service.dart';
import 'package:instantsewa/services/profiles_service.dart';
import 'package:instantsewa/services/service_providers_service.dart';
import 'package:instantsewa/ui/signup_page.dart';
//import 'package:instantsewa/ui/address_page.dart';
//import 'package:instantsewa/ui/otp_page.dart';
//import 'package:instantsewa/ui/payment_page.dart';
//import 'package:instantsewa/ui/schedule_page.dart';
//import 'package:instantsewa/ui/forgot_password_page.dart';

//import 'ui/home_page.dart';

void setup() {
  GetIt.instance.registerSingleton<HandyMansService>(HandyMansService());
  GetIt.instance.registerSingleton<ServiceProvidersService>(ServiceProvidersService());
  GetIt.instance.registerSingleton<ProfilesService>(ProfilesService());
}

void main() {
  setup();
  runApp(new MaterialApp(
    //home: OtpPage(),
    //home: ForgotPasswordPage(),
    //home: HomePage(),
    //home: PaymentPage(),
    //home: SchedulePage(),
    //home: AddressPage(),
    home: SignupPage(),
    debugShowCheckedModeBanner: false,
  ));
}
