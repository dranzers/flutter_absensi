import 'package:flutter/material.dart';
import 'package:flutter_absensi/core/providers/login_provider.dart';
import 'package:provider/provider.dart';

import '../../../../routes_path.dart';

class ButtonLogin extends StatelessWidget {
  final Function onPressLogin;

  ButtonLogin({this.onPressLogin});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesPath.FORGOT);
            },
            child: Text(
              'Lupa password ?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
          ),
          color: Colors.transparent,
        ),
        loadingOrButton(context)
      ],
    );
  }

  Widget loadingOrButton(BuildContext context) {
    return (context.watch<LoginProvider>().busy)
        ? Padding(
            padding: EdgeInsets.only(right: 5),
            child: CircularProgressIndicator())
        : ButtonTheme(
            padding: EdgeInsets.symmetric(horizontal: 37.0, vertical: 12.0),
            child: FlatButton(
              color: Color(0xffC4C4C4),
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              splashColor: Colors.grey,
              onPressed: onPressLogin,
              child: Text('Login'),
            ),
          );
  }
}
