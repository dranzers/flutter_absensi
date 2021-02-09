import 'package:flutter/material.dart';

class NavigateBack extends StatelessWidget {
  final String title;

  const NavigateBack({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
        Material(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text('$title', style: TextStyle(fontSize: 18)),
          ),
          color: Colors.transparent,
        ),
      ],
    );
  }
}
