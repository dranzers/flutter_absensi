import 'package:flutter/foundation.dart';
import 'package:flutter_absensi/core/providers/base_provider.dart';
import 'package:flutter_absensi/core/services/authentication_service.dart';

class LoginProvider extends BaseProvider {
  AuthenticationService _authenticationService;

  LoginProvider({
    @required AuthenticationService authenticationService,
  }) : _authenticationService = authenticationService;

  Future<bool> login(String userIdText) async {
    setBusy(true);
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);
    setBusy(false);
    return success;
  }
}
