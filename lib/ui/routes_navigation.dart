import 'package:flutter/material.dart';
import 'package:flutter_absensi/routes_path.dart';
import 'package:flutter_absensi/ui/views/forgotpassword/view_forgot_password.dart';
import 'package:flutter_absensi/ui/views/home/view_home.dart';
import 'package:flutter_absensi/ui/views/inputabsen/view_input_absen.dart';
import 'package:flutter_absensi/ui/views/login/view_login.dart';
import 'package:flutter_absensi/ui/views/setting/view_setting.dart';

class RoutesNavigation {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesPath.LOGIN:
        return MaterialPageRoute(builder: (_) => ViewLogin());
      case RoutesPath.HOME:
        return MaterialPageRoute(builder: (_) => ViewHome());
      case RoutesPath.FORGOT:
        return MaterialPageRoute(builder: (_) => ViewForgotPassword());
      case RoutesPath.SETTING:
        return MaterialPageRoute(builder: (_) => ViewSetting());
      case RoutesPath.INPUT:
        return MaterialPageRoute(builder: (_) => ViewInputAbsen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
