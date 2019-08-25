import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String text = "tharejatanmay@gmail.com";
  final myController = TextEditingController();
  // @override
  // void initState() {
  //   super.initState();

  //   myController.addListener(changeText());
  // }

   @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Tanmay Thareja",
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              ),
          ),
          GestureDetector(
                        child: Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                          child: TextField(
                            
                          ),
                        ),
                     ),
                    ],
                  ),
                  
                );
              } 
}