import 'package:flutter/material.dart';
import 'Home.dart';

class OtpSingIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Colors.white)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField(
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: new InputDecoration(labelText: "Enter OTP"),
              ),
            ),
            new SizedBox(
              height: 10.0,
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
                          child: new Text("Verify OTP",
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
