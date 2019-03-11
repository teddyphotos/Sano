import 'package:flutter/material.dart';
import 'mapScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 1;
    final List<Widget> _children = [mapScreen(), mapScreen(), mapScreen()];
    void _onTabTapped(int index){
      setState(() {
        _selectedIndex = index;
      });
    }
    return

      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sano: Emergency Help"),
        backgroundColor: Colors.redAccent,
      ),

      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.edit_location), title: Text("Location")),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: Text("Get Ambulance")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text("Options")),
          ],
        fixedColor: Colors.redAccent,
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

