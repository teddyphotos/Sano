import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool editing=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(editing==false)
          {
            setState(() {
              editing=true;
            });
          }
          else if(editing==true)
          {
            setState(() {
              editing=false;
            });
          }
       },
       child: editing?Icon(Icons.check):Icon(Icons.edit),
      ),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
      ),
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
              margin: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
              child: ListTile(
                leading: Icon(Icons.phone,color:Colors.teal),
                title: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal,
                  ),
                  enabled: editing,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "9971612559",
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color:Colors.teal,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
              child: ListTile(
                leading: Icon(Icons.mail,color:Colors.teal),
                title: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal,
                  ),
                  enabled: editing,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "tharejatanmay@gmail.com",
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color:Colors.teal,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
              child: ListTile(
                leading: Icon(Icons.account_box,color:Colors.teal),
                title: TextField(
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal,
                  ),
                  enabled: editing,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Tanmay Thareja",
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color:Colors.teal,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
              child: ListTile(
                leading: Icon(Icons.favorite,color:Colors.teal),
                title: TextField(
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal,
                  ),
                  enabled: editing,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "B+",
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color:Colors.teal,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}