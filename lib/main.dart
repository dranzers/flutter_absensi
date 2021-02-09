import 'package:flutter/material.dart';
import 'package:flutter_absensi/provider_setup.dart';
import 'package:flutter_absensi/routes_path.dart';
import 'package:flutter_absensi/ui/routes_navigation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: providers, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Absensi',
      initialRoute: RoutesPath.LOGIN,
      onGenerateRoute: RoutesNavigation.generateRoutes,
    );
  }
}
