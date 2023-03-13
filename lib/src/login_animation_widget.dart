import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
class LoginAnimationWidget extends StatefulWidget {

  @override
  State<LoginAnimationWidget> createState() => _LoginAnimationWidgetState();
}

class _LoginAnimationWidgetState extends State<LoginAnimationWidget> {

  late RiveAnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = OneShotAnimation("idle");
    }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.5,
      child: RiveAnimation.asset(
        "assets/login.riv",
        artboard: "Login Artboard",
        animations: ["login"],
        controllers: [_animationController],
      ),
    );
  }
}
