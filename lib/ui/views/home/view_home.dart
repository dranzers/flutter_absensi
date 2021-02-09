import 'package:flutter/material.dart';
import 'package:flutter_absensi/core/models/user.dart';
import 'package:flutter_absensi/core/providers/home_provider.dart';
import 'package:flutter_absensi/ui/views/home/widget/home_dashboard.dart';
import 'package:flutter_absensi/ui/views/home/widget/home_header.dart';
import 'package:flutter_absensi/ui/views/home/widget/home_information.dart';
import 'package:flutter_absensi/ui/views/home/widget/home_list_activity.dart';
import 'package:provider/provider.dart';

class ViewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('ini ${context.watch<User>()}');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: context.watch<User>() == null
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 22),
                      HomeHeader(),
                      SizedBox(height: 19),
                      HomeDashboard(),
                      SizedBox(height: 6),
                      HomeInformation(),
                      SizedBox(height: 19),
                      Text(
                        'Aktivitas',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Informasi absensi terakhir',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14),
                      ),
                      SizedBox(height: 11),
                      HomeListActivity(
                          lists: context.watch<HomeProvider>().presensi)
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
