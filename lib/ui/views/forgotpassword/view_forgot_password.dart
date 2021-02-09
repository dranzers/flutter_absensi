import 'package:flutter/material.dart';
import 'package:flutter_absensi/ui/views/common/navigate_back.dart';
import 'package:flutter_absensi/ui/views/common/text_input.dart';

class ViewForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigateBack(title: 'Kembali'),
                Spacer(),
                Text(
                  'Lupa Password',
                  style: TextStyle(fontSize: 36),
                ),
                SizedBox(height: 5),
                Text(
                    'Masukan email anda. Konfirmasi reset password akan dikirim melalui email anda. ',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                SizedBox(height: 23),
                TextInput(key: UniqueKey(), hintText: 'Email'),
                SizedBox(height: 14),
                ButtonTheme(
                  minWidth: 0,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding:
                      EdgeInsets.symmetric(horizontal: 37.0, vertical: 12.0),
                  child: FlatButton(
                    color: Color(0xffC4C4C4),
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    splashColor: Colors.grey,
                    onPressed: () {},
                    child: Text('Kirim'),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
