import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  Completer<GoogleMap> _controller = Completer();
  static final CameraPosition _kgoogleflex =
      CameraPosition(target: LatLng(37.42796, -122.085), zoom: 14.47);
  List<Marker> _marker = [];
  final List<Marker> _list = [
    const Marker(infoWindow: InfoWindow(
      title: "My Position"
    ),markerId: MarkerId("1"), position: LatLng(37.42796, -122.085))
  ];

@override
  void initState() {
    _marker.addAll(_list);
  }
   Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: Set<Marker>.of(_marker),
        initialCameraPosition: _kgoogleflex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller as FutureOr<GoogleMap>?);
        },
        mapType: MapType.normal,
        myLocationEnabled: true,
      ),
    );
  }
}
