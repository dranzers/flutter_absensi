import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absensi/core/models/absensi.dart';
import 'dart:math' as math;

class HomeListActivity extends StatelessWidget {
  final List<Absensi> lists;

  const HomeListActivity({Key key, this.lists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lists.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 5),
          key: UniqueKey(),
          width: MediaQuery.of(context).size.width,
          color: Color(0xffC4C4C4),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${lists[index].waktu} • ${lists[index].tanggal} • ${lists[index].status == 1 ? 'Masuk' : 'Pulang'}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height: 3),
                      Text(
                        '${lists[index].lokasi}',
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Transform(
                  alignment: Alignment.center,
                  transform: lists[index].status == 1
                      ? Matrix4.rotationY(0)
                      : Matrix4.rotationY(math.pi),
                  child: Icon(
                    Icons.directions_run_outlined,
                    size: 24,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
