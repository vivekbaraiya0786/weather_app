import 'dart:async';
import 'package:flutter/material.dart';

class spalsh_screen extends StatefulWidget {
  const spalsh_screen({Key? key}) : super(key: key);

  @override
  State<spalsh_screen> createState() => _spalsh_screenState();
}

class _spalsh_screenState extends State<spalsh_screen> {


  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/');
    });

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/dashboard_weather_circle_dribbble.gif"),
              fit: BoxFit.fill,
            )
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
