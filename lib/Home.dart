import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'legalStuff.dart';
import 'mapScreen.dart';
import 'Account.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PermissionStatus _status;
  int _selectedIndex = 1;
  final GlobalKey<ScaffoldState>_scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    PermissionHandler()
        .checkPermissionStatus(PermissionGroup.locationWhenInUse)
        .then(_updateStatus);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [legalStuff(), mapScreen(), mapScreen()];
    void _onTabTapped(int index) {
      setState(() {
        _selectedIndex = index;
        if(index==2)
        {
          _scaffoldKey.currentState.openDrawer();
          index=1;
          _onTabTapped(index);
        }
      });
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Container(),
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Account()
                ));
              },
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                ),
                 accountName: Text(
                   "Tanmay Thareja",
                   style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold),
                 ),
                 accountEmail: Text("tharejatanmay@gmail.com"),
              ),
            ),
            ListTile(
              title: Text("Legal"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("About Us"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("Contact Us"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("Log Out"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
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
              icon: Icon(Icons.settings), title: Text("Options")),
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
