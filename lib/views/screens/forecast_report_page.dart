import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../contoller/provider/connectivty_provider.dart';
import '../../contoller/provider/weather_provider.dart';
import '../../models/weather_model.dart';

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
    double __width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: (Provider.of<ConnectivityProvider>(context)
                  .connectitvityModel
                  .connectivitystatus ==
              "Waiting..")
          ? const Center(
              child: Text("No Data Connection"),
            )
          : SafeArea(
              child: FutureBuilder(
                future: Provider.of<WeatherProvider>(context, listen: false)
                    .Weatherdata(
                        Provider.of<WeatherProvider>(context, listen: true)
                            .location),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("ERROR : ${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    WeatherModel? weatherdata = snapshot.data;
                    return (weatherdata == null)
                        ? const Center(
                            child: Text("No Data avilable"),
                          )
                        : Container(
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(14),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: _height * 0.01,
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                icon: Icon(
                                                  Icons.keyboard_arrow_left,
                                                  color: Colors.white,
                                                  size: 35,
                                                )),
                                            SizedBox(
                                              width: __width * 0.15,
                                            ),
                                            Text(
                                              "Forecast Report",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: _height * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Today",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                                "${DateFormat('MMMM').format(dateTime)} ${dateTime.day}, ${dateTime.year}",
                                                style: const TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 16)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 15,
                                  child: Column(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            ...weatherdata.hour
                                                .map((e) => Container(
                                                      height: 70,
                                                      width: 160,
                                                      margin:
                                                          EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  height: 50,
                                                                  width: 50,
                                                                  decoration: BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              NetworkImage("http:${weatherdata.icon}"))),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                        _height *
                                                                            0.01,
                                                                  ),
                                                                  Text(
                                                                    e['time']
                                                                        .toString()
                                                                        .split(
                                                                            " ")[1],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        _height *
                                                                            0.01,
                                                                  ),
                                                                  Text(
                                                                    "${e['temp_c']} °c",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  )
                                                                ]),
                                                          ),
                                                        ],
                                                      ),
                                                    ))
                                                .toList()
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: __width * 0.15,
                                      ),
                                      Container(
                                        height: _height * 0.2,
                                        width: __width * 0.8,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.white,
                                          ),
                                          color: Colors.black26,
                                        ),
                                        // alignment:Alignment.topCenter,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/images/sun2.png"))),
                                                ),
                                                Text(
                                                  "SunRise\n${weatherdata.sunrise}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/images/sunset.png"))),
                                                ),
                                                Text(
                                                  "SunSet\n${weatherdata.sunset}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: __width * 0.15,
                                      ),
                                      Container(
                                        height: _height * 0.2,
                                        width: __width * 0.8,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.white,
                                          ),
                                          color: Colors.black26,
                                        ),
                                        // alignment:Alignment.topCenter,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/cloud.png"),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "Cloud\n    ${weatherdata.cloud}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/images/humdity.png"))),
                                                ),
                                                Text(
                                                  "Humidity\n    ${weatherdata.humidity}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: __width * 0.15,
                                      ),
                                      const Spacer(),
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.home,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),

                                            IconButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed('forecast');
                                                },
                                                icon: const Icon(
                                                  Icons.wallet,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.settings,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                  }
                  return Container(
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
                    child: Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.blue,
                        size: 130,
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
