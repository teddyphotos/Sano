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
  String bookingButtonStatus;
  bool bookingStatus = false;

  PermissionStatus _status;
  int _selectedIndex = 1;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        if (index == 2) {
          _scaffoldKey.currentState.openDrawer();
          index = 1;
          _onTabTapped(index);
        }
      });
    }
    if(bookingStatus){
      bookingButtonStatus = "Cancel Booking";

    }else{
      bookingButtonStatus = "Book Now";

    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        appBar: AppBar(
          title: Text(bookingButtonStatus),
          backgroundColor: Colors.redAccent,
          leading: new Container(),


        ),
        onTap: (){
          if(bookingStatus){
            print("Stopped Booking");
            bookingStatus = false;

          }else{
            print("Started Booking");
            bookingStatus = true;
          }


          setState(() {

          });
        },
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Account()));
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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTap;
  final AppBar appBar;

  const CustomAppBar({Key key, this.onTap, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: appBar);

  }

  // TODO: implement preferredSize
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
