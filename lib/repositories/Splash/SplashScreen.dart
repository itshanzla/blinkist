import 'dart:async';
import 'package:blinkist/main.dart';
import 'package:blinkist/repositories/Screens/AuthScreens/Auth.dart';
import 'package:flutter/material.dart'; // make sure this import is correct

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(image: AssetImage("assets/images/BlinkistLogo.png")),
      ),
    );
  }
}
