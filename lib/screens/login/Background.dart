
import 'package:flutter/material.dart';

class Background extends StatelessWidget {

  final Widget child;


   Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
                "assets/images/top1.png",
                width: size.width
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
                "assets/images/top22.png",
                width: size.width
            ),
          ),
          Positioned(
            top: 60,
            right: -25,
            child: Image.asset(
                "assets/images/orange.png",
                width: size.width * 0.50
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
                "assets/images/bottom11.png",
                width: size.width
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
                "assets/images/bottom22.png",
                width: size.width
            ),
          ),
          child
        ],
      ),
    );
  }
}