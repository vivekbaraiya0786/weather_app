import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Forecast_page extends StatefulWidget {
  const Forecast_page({Key? key}) : super(key: key);

  @override
  State<Forecast_page> createState() => _Forecast_pageState();
}

class _Forecast_pageState extends State<Forecast_page> {

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _height = size.height;
    double _width = size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xff06437a),
                  Color(0xff090832),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.05, 1]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                SizedBox(
                  height: _height * 0.03,
                ),
                Text("Forecast report",style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24,
                )),
                SizedBox(
                  height: _height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today",style: TextStyle(color: Colors.white,fontSize: 20),),
                    Text(
                        "${DateFormat('MMMM').format(dateTime)} ${dateTime.day}, ${dateTime.year}",
                        style: const TextStyle(
                            color: Colors.white70,fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
