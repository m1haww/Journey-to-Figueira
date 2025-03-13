import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_figueira/pages/navigation.dart';
import 'package:journey_to_figueira/utils/base.dart';
import 'package:journey_to_figueira/utils/colors.dart';

class SplashingScreen extends StatefulWidget {
  const SplashingScreen({super.key});

  @override
  State<SplashingScreen> createState() => _SplashingScreenState();
}

class _SplashingScreenState extends State<SplashingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => Navigation()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: TweenAnimationBuilder(
                duration: Duration(seconds: 2),
                curve: Curves.easeInOut,
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double value, child) {
                  return Transform.scale(
                    scale: 0.8 + (0.2 * value),
                    child: Opacity(opacity: value, child: child),
                  );
                },
                child: Text(
                  "Journey \n of \n Figueira",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: kGold,
                    fontFamily: "Serif",
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
