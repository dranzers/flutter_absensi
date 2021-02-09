import 'package:flutter_absensi/core/providers/home_provider.dart';
import 'package:flutter_absensi/core/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/models/user.dart';
import 'core/services/api.dart';
import 'core/services/authentication_service.dart';

List<SingleChildWidget> providers = [
  Provider.value(value: Api()),
  ProxyProvider<Api, AuthenticationService>(
    update: (context, api, authenticationService) =>
        AuthenticationService(api: api),
  ),
  StreamProvider<User>(
    create: (context) => context.read<AuthenticationService>().user,
  ),
  ChangeNotifierProxyProvider<AuthenticationService, LoginProvider>(
    create: (context) => LoginProvider(
        authenticationService: context.read<AuthenticationService>()),
    update: (context, value, previous) => previous,
  ),
  ChangeNotifierProvider(create: (context) => HomeProvider()),
];
