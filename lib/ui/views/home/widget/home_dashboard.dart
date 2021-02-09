import 'package:flutter/material.dart';

import '../../../../routes_path.dart';

class HomeDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      color: Color(0xffC4C4C4),
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RoutesPath.INPUT);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Rabu,',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                    SizedBox(width: 4),
                    Text('10 Januari 2020', style: TextStyle(fontSize: 14)),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('06:30 • ',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.normal)),
                    Text('Masuk',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w100)),
                  ],
                ),
                SizedBox(height: 1),
                Text(
                  'Jln. Simokerto No  1, Desa Limakuda Banyuwangi Kota',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Rencana Kerja',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_right_alt_rounded)
                  ],
                ),
              ],
            ),
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
