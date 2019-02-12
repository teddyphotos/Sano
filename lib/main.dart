import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(

  theme:
        ThemeData(primaryColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
));

class SplashIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = AssetImage('assets/images/icon.png');
    var image = Image(image: assetsImage,height: 40.0,width: 40.0,);
    return Container(
      child: image,    
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SplashIcon(),
      ),

      

    );
  }
}