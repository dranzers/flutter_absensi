import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  TextEditingController controller;

  TextInput({Key key, this.hintText, this.obscureText = false, this.controller})
      : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autofocus: false,
      obscureText: widget.obscureText,
      style: TextStyle(fontWeight: FontWeight.w300),
      decoration: InputDecoration(
          hintStyle: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 14,
              color: Color(0xffC4C4C4)),
          hintText: widget.hintText,
          contentPadding:
              EdgeInsets.symmetric(vertical: 11.0, horizontal: 20.0),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.zero),
              borderSide: BorderSide(color: Color(0xffC4C4C4), width: 0.5)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.zero),
              borderSide: BorderSide(color: Color(0xffC4C4C4), width: 0.5))),
    );
  }
}
