import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';



void main() => runApp(MaterialApp(

        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
));

class SplashIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = AssetImage('assets/images/icon.png');
    var image = Image(image: assetsImage,height: 80.0,width: 80.0,);
    return Container(
      child: image,    
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;

  @override

  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 1),vsync: this);
    animation = Tween<double>(begin: 0 , end: 100).animate(controller)
    ..addListener((){

      setState(() {
        
      }); 
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.red[900],
      body: Center(
<<<<<<< HEAD
        child: SplashIcon(),
=======

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Container(
              height: animation.value,
              width: animation.value,
              child: SplashIcon(),

            ),
            Text(
              "Sano",
              style: TextStyle(
                fontSize: 50.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),

            ),
          ],
        )
>>>>>>> 90a1987fd8e1a9992930fa04a5166c9f6f10cc1f
      ),

      

    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}