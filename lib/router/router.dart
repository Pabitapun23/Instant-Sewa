import 'package:flutter/material.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/ui/Auth/login_page.dart';
import 'package:instantsewa/ui/Auth/signup_page.dart';
import 'package:instantsewa/ui/categories_list.dart';
import 'package:instantsewa/ui/employee_card.dart';
import 'package:instantsewa/ui/home_page.dart';
import 'package:instantsewa/ui/not_found_page_views.dart';
import 'package:instantsewa/ui/notification_message.dart';
import 'package:instantsewa/ui/on_boarding_page.dart';
import 'package:instantsewa/ui/otp_page.dart';
import 'package:instantsewa/ui/profile_page.dart';
import 'package:instantsewa/ui/sub_categories_page.dart';
import 'package:instantsewa/ui/track_order_page.dart';
import 'package:instantsewa/ui/user_address_page.dart';
import 'package:instantsewa/ui/user_info_page.dart';
import 'package:instantsewa/ui/user_phone_page.dart';

class Routers {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case categoriesRoute:
        return MaterialPageRoute(builder: (_) => CategoryList());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignupPage());
      case subCategoryRoute:
        return MaterialPageRoute(builder: (_) => SubCategoriesPage());
      case fullNameUpdateRoute:
        return MaterialPageRoute(builder: (_) => UserInfoPage());
      case phoneUpdateRoute:
        return MaterialPageRoute(builder: (_) => UserPhonePage());
      case addressUpdateRoute:
        return MaterialPageRoute(builder: (_) => UserAddressPage());
      case profileimageupdateRoute:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case trackerRoute:
        return MaterialPageRoute(builder: (_) => TrackOrder());
      case notificationRoute:
        return MaterialPageRoute(builder: (_) => NotificationMessage());
      case otpRoute:
        return MaterialPageRoute(builder: (_) => OtpPage());

      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
