import 'package:flutter/material.dart';
import 'package:flutter_absensi/core/providers/login_provider.dart';
import 'package:flutter_absensi/ui/views/login/widgets/button_login.dart';
import 'package:flutter_absensi/ui/views/login/widgets/text_information.dart';
import 'package:flutter_absensi/ui/views/common/text_input.dart';
import 'package:provider/provider.dart';

import '../../../routes_path.dart';

class ViewLogin extends StatefulWidget {
  @override
  _ViewLoginState createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text('Login', style: TextStyle(fontSize: 36)),
                  SizedBox(height: 5),
                  Text('Silahkan login untuk melakukan absen',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                  SizedBox(height: 23),
                  TextInput(
                    hintText: 'Username',
                    controller: _usernameController,
                    key: UniqueKey(),
                  ),
                  SizedBox(height: 14),
                  TextInput(
                      hintText: 'Password',
                      obscureText: true,
                      key: UniqueKey()),
                  SizedBox(height: 14),
                  ButtonLogin(onPressLogin: onPressedFunction),
                  SizedBox(height: 23),
                  TextInformation()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future onPressedFunction() async {
    var loginSuccess =
        await context.read<LoginProvider>().login(_usernameController.text);
    if (loginSuccess) {
      Navigator.pushNamed(context, RoutesPath.HOME);
    }
  }
}
