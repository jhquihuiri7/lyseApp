import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late RiveAnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = SimpleAnimation("idle");
    startTime();

  }
  startTime() async {
    var duration = new Duration(milliseconds: 3000);
    return new Timer(duration, (){
      Navigator.pushReplacementNamed(context, "login");
    });
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: size.width,
          height: size.height * 0.5,
          child: RiveAnimation.asset(
            "assets/splash.riv",
            artboard: "Splash Artboard",
            animations: ["splash"],
            controllers: [_animationController],
          ),
        ),
      ),
    );
  }
}
