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
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),

            ),
          ],
        )
      ),
      
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}