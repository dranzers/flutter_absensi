import 'package:flutter/material.dart';

class HomeInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        presensiInformation(context, 'Lupa Absen', 4),
        SizedBox(width: 6),
        presensiInformation(context, 'Izin', 0),
        SizedBox(width: 6),
        presensiInformation(context, 'Alpha', 0),
        Spacer(),
        Container(
          width: MediaQuery.of(context).size.width / 5.0,
          height: MediaQuery.of(context).size.height / 8.5,
          child: Material(
            child: InkWell(
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Comming Soon'),
                  duration: Duration(milliseconds: 1000),
                ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.play_circle_outline),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 6.0, left: 6.0, right: 6.0, top: 6.0),
                    child: Text(
                      'Lihat Histori',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ),
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }

  Widget presensiInformation(BuildContext context, String name, int count) {
    return Container(
      width: MediaQuery.of(context).size.width / 5.0,
      height: MediaQuery.of(context).size.height / 8.5,
      // color: Colors.grey,
      decoration: BoxDecoration(
        color: Color(0xffC4C4C4),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '${count.toString()}',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 6.0, left: 6.0, right: 6.0, top: 6.0),
            child: Text(
              '$name',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}
