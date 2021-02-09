import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_absensi/ui/views/common/navigate_back.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ViewInputAbsen extends StatefulWidget {
  @override
  _ViewInputAbsenState createState() => _ViewInputAbsenState();
}

class _ViewInputAbsenState extends State<ViewInputAbsen> {
  Completer<GoogleMapController> _controller = Completer();
  Location _location = Location();
  Widget _mapWidget;
  Address _address;

  LocationData _myLocation;
  String _errorGetCurrentLocation;
  MarkerId _markerId = MarkerId('mylocation');

  Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers =
      <Factory<OneSequenceGestureRecognizer>>[
    new Factory<OneSequenceGestureRecognizer>(
      () => new EagerGestureRecognizer(),
    ),
  ].toSet();

  @override
  void initState() {
    _currentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 22),
                NavigateBack(title: 'Input Data Absen'),
                SizedBox(height: 36),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        autofocus: false,
                        style: TextStyle(fontWeight: FontWeight.w300),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 14,
                                color: Color(0xffC4C4C4)),
                            hintText: 'Rencana Kerja',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 11.0, horizontal: 20.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.zero),
                                borderSide: BorderSide(
                                    color: Color(0xffC4C4C4), width: 0.5)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.zero),
                                borderSide: BorderSide(
                                    color: Color(0xffC4C4C4), width: 0.5))),
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 0,
                      padding: EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                        side: BorderSide(color: Color(0xffC4C4C4), width: 0.5),
                      ),
                      child: FlatButton(
                        color: Color(0xffC4C4C4),
                        splashColor: Colors.grey,
                        onPressed: () {},
                        child: Icon(
                          Icons.add_outlined,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 9),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffC4C4C4),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Melakukan refactoring code pada module ...'),
                            SizedBox(height: 4),
                            Text(
                              'Sedang dikerjakan',
                              style: TextStyle(
                                  fontWeight: FontWeight.w200, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 9),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(width: 1, color: Color(0xffC4C4C4))),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Menambahkan fitur searching pada module ...'),
                            SizedBox(height: 4),
                            Text(
                              'Selesai',
                              style: TextStyle(
                                  fontWeight: FontWeight.w200, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 19),
                Text(
                  'Lokasi',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                SizedBox(height: 4),
                Text(
                  'Pastikan lokasi anda valid',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                ),
                SizedBox(height: 9),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                  color: Colors.grey,
                  child: _mapWidget,
                ),
                SizedBox(height: 9),
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
                    onPressed: () {
                      print(getUserLocation());
                    },
                    child: Text('Mulai Bekerja'),
                  ),
                ),
                SizedBox(height: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _mapGoogle() {
    return GoogleMap(
      gestureRecognizers: gestureRecognizers,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(_myLocation.latitude, _myLocation.longitude),
        zoom: 15.0,
      ),
      onMapCreated: (controller) {
        _controller.complete(controller);
        controller.showMarkerInfoWindow(_markerId);
      },
      // myLocationEnabled: true,
      markers: _createMarker(),
    );
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: _markerId,
        position: LatLng(_myLocation.latitude, _myLocation.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: InfoWindow(
            title: '${_address.addressLine}',
            snippet:
                '${_myLocation.latitude.toString()} , ${_myLocation.longitude.toString()}'),
      ),
    ].toSet();
  }

  void _currentLocation() async {
    try {
      _myLocation = await _location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        _errorGetCurrentLocation = 'please grant permission';
        print(_errorGetCurrentLocation);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        _errorGetCurrentLocation =
            'permission denied- please enable it from app settings';
        print(_errorGetCurrentLocation);
      }
      _myLocation = null;
    }

    _address = await getUserLocation();
    setState(() {
      _mapWidget = _mapGoogle();
    });
  }

  Future<Address> getUserLocation() async {
    final coordinates =
        new Coordinates(_myLocation.latitude, _myLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print(
        ' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    return first;
    // return '${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}';
  }
}
