import 'package:flutter/material.dart';
import 'package:flutter_absensi/routes_path.dart';
import 'package:flutter_absensi/ui/views/common/navigate_back.dart';
import 'package:flutter_absensi/ui/views/common/text_input.dart';

class ViewSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 24,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavigateBack(title: 'Pengaturan'),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              ClipOval(
                                child: Image(
                                  image: AssetImage('lib/images/profil.png'),
                                  width: 104,
                                  height: 104,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 1,
                                right: 5,
                                child: Container(
                                  child: Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Icon(Icons.edit_outlined)),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffC4C4C4)),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 1, color: Color(0xffC4C4C4)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Email', style: TextStyle(fontSize: 14)),
                        SizedBox(height: 8),
                        TextInput(hintText: 'Email'),
                        SizedBox(height: 14),
                        Text('Ubah Password', style: TextStyle(fontSize: 14)),
                        SizedBox(height: 8),
                        TextInput(
                            hintText: 'Password Sebelumnya', obscureText: true),
                        SizedBox(height: 8),
                        TextInput(hintText: 'Password Baru', obscureText: true),
                        SizedBox(height: 14),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ButtonTheme(
                            minWidth: 0,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            padding: EdgeInsets.symmetric(
                                horizontal: 37.0, vertical: 12.0),
                            child: FlatButton(
                              color: Color(0xffC4C4C4),
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              splashColor: Colors.grey,
                              onPressed: () {},
                              child: Text('Simpan'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: OutlineButton(
                      splashColor: Colors.grey,
                      borderSide:
                          BorderSide(width: 2.0, color: Color(0xffC4C4C4)),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, RoutesPath.LOGIN, (_) => false);
                      },
                      child: Text('Logout'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
