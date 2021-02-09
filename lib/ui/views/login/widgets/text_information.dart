import 'package:flutter/material.dart';

class TextInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Color(0xffCEEBF6),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
        child: Text(
          'Jika belum punya akun, dapat menghubungi petugas admin',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
        ),
      ),
    );
  }
}
