import 'package:flutter/material.dart';
import 'dart:async';
import 'Home.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Colors.redAccent)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: new TextField(
                      decoration: new InputDecoration(labelText: "First name"),
                    ),
                  ),
                ),
                new Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: new TextField(
                      decoration: new InputDecoration(labelText: "Last name"),
                    ),
                  ),
                ),
              ],
            ),
            new SizedBox(
              height: 20.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Sample Number: 9988776655",
                    style: new TextStyle(
                      fontSize: 20.0,
                    ))
              ],
            ),
            new SizedBox(
              height: 20.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: new TextField(
                      maxLength: 2,
                      decoration: new InputDecoration(labelText: "Blood Group"),
                    ),
                  ),
                ),
                new Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: new TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      decoration: new InputDecoration(labelText: "Age"),
                    ),
                  ),
                ),
              ],
            ),
            new SizedBox(
              height: 20.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: new TextField(
                      decoration: const InputDecoration(
                        labelText: 'Add any history of diseases:',
                      ),
                      autofocus: false,
                      maxLines: null,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
              ],
            ),
            new SizedBox(
              height: 140.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ));
                      },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: new BoxDecoration(
                              color: Colors.red[400],
                              borderRadius: new BorderRadius.circular(9.0)),
                          child: new Text("Submit Details",
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.white))),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
