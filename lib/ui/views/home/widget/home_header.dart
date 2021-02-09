import 'package:flutter/material.dart';
import 'package:flutter_absensi/core/models/user.dart';
import 'package:flutter_absensi/routes_path.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Color(0xffC4C4C4),
          child: Text(
            '${context.read<User>().name.substring(0, 1)}',
            style: TextStyle(color: Colors.grey, fontSize: 24),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${context.read<User>().name}',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 4),
              Text('Pegawai',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200))
            ],
          ),
        ),
        SizedBox(width: 16),
        Material(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesPath.SETTING);
            },
            child: Icon(
              Icons.settings,
              size: 24,
            ),
          ),
          color: Colors.transparent,
        ),
      ],
    );
  }
}
