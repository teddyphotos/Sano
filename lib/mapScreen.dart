import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class mapScreen extends StatefulWidget {
  @override
  _mapScreenState createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  Location location = new Location();
  GoogleMapController mapController;
  final LatLng _center = const LatLng(13.784307, 80.014821);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            options: GoogleMapOptions(
              trackCameraPosition: true,
                cameraPosition: CameraPosition(target: _center, zoom: 11.0)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                elevation: 8.0,
                onPressed: () {
                  print("Button Pressed");
                  _animateToUser();
                },
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.redAccent,
                child: const Icon(
                  Icons.call,
                  size: 36.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _animateToUser() async{
    var pos = await location.getLocation();
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(

            target: LatLng(pos.latitude, pos.longitude),
            zoom: 16.0

        )
    ));
    mapController.addMarker(
        MarkerOptions(
            position: LatLng(pos.latitude, pos.longitude),
            icon: BitmapDescriptor.defaultMarker
        )
    );
  }
}
