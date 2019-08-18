import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'options.dart';
import 'legalStuff.dart';
import 'mapScreen.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PermissionStatus _status;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    PermissionHandler()
        .checkPermissionStatus(PermissionGroup.locationWhenInUse)
        .then(_updateStatus);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [legalStuff(), mapScreen(), options()];
    void _onTabTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sano: Emergency Help"),
        backgroundColor: Colors.redAccent,
      ),
      body: _children[_selectedIndex],
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red[400],
        icon: Icon(Icons.local_hospital),
        label: Text("Emergency"),
      ),

      bottomNavigationBar: BottomNavigationBar(

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.bubble_chart), title: Text("Developer")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("Get Ambulance")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Options")),
        ],
        fixedColor: Colors.redAccent,
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _updateStatus(PermissionStatus status) {
    if (status != _status) {
      _askLocationPermission();
      setState(() {
        _status = status;
      });
    }
  }

  void _askLocationPermission() {
    PermissionHandler().requestPermissions(
        [PermissionGroup.locationWhenInUse]).then(_onStatusRequested);
  }

  void _onStatusRequested(Map<PermissionGroup, PermissionStatus> statuses) {
    final status = statuses[PermissionGroup.locationWhenInUse];
    _updateStatus(status);
  }
}
