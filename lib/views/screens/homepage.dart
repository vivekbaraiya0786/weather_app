import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../contoller/provider/connectivty_provider.dart';
import '../../contoller/provider/weather_provider.dart';
import '../../models/weather_model.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? _weatherModel;

  DateTime dateTime = DateTime.now();
  int initalgroupvalue = 0;

  Map<int, Widget> data = {
    0: const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      child: Text("Forecast",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    ),
    1: const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      child: Text("Air Quality",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    ),
  };

  // int selectedIndex = 0;
  // List<Widget> pages = [
  //
  // ];
  //
  // void onItemTapped(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

  // TextEditingController textController = TextEditingController();
  //
  // WeatherModel? weatherModel;
  //
  // late Future<WeatherModel?> weatherdata;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   weatherdata = APIHelper.apiHelper.fetchweather();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _height = size.height;
    double _width = size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   title: const Text("Weather App"),
        //   centerTitle: true,
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         Provider.of<AppThemeProvider>(context, listen: false)
        //             .ChangeTheme();
        //       },
        //       icon: Icon(
        //         (Provider.of<AppThemeProvider>(context).appThemeModel.isDark)
        //             ? Icons.light_mode_outlined
        //             : Icons.dark_mode,
        //       ),
        //     ),
        //     // IconButton(
        //     //     onPressed: () {
        //     //       weatherdata = APIHelper.apiHelper.fetchweather();
        //     //     },
        //     //     icon: const Icon(Icons.refresh))
        //   ],
        // ),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Color(0xff060620),
        //   unselectedItemColor: Colors.white,
        //   showSelectedLabels: false,
        //   showUnselectedLabels: false,
        //   currentIndex: selectedIndex,
        //   onTap: onItemTapped,
        //   items:[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.cloud),
        //       label: 'Forecast',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.settings),
        //       label: 'Settings',
        //     ),
        //   ],
        // ),
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
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 12,
                                          ),
                                          child: AnimSearchBar(
                                            // rtl: true,
                                            width: 330,
                                            textController:
                                                Provider.of<WeatherProvider>(
                                                        context,
                                                        listen: false)
                                                    .citynamecontroller,
                                            onSuffixTap: () {
                                              setState(() {
                                                Provider.of<WeatherProvider>(
                                                        context,
                                                        listen: false)
                                                    .citynamecontroller
                                                    .clear();
                                              });
                                            },
                                            closeSearchOnSuffixTap: true,
                                            onSubmitted: (String name) {
                                              if (name.isNotEmpty) {
                                                print(name);
                                                Provider.of<WeatherProvider>(
                                                        context,
                                                        listen: false)
                                                    .locationchanage(name);
                                              }
                                              // else {
                                              //   Provider.of<WeatherProvider>(context, listen: false).locationchanage(Provider.of<WeatherProvider>(context).location);
                                              // }
                                            },
                                            helpText: '  Enter City',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                            textFieldColor: Colors.white,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.refresh,
                                              color: Colors.white, size: 30),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 9,
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "${weatherdata.name}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "${DateFormat('MMMM').format(dateTime)} ${dateTime.day}, ${dateTime.year}",
                                            style: const TextStyle(
                                                color: Colors.white60)),
                                        SizedBox(
                                          height: _width * 0.05,
                                        ),
                                        CupertinoSlidingSegmentedControl(
                                            padding: const EdgeInsets.all(5),
                                            thumbColor: const Color(0xff1b86e6),
                                            onValueChanged: (value) {
                                              setState(() {
                                                initalgroupvalue = value!;
                                              });
                                            },
                                            groupValue: initalgroupvalue,
                                            children: data),
                                        SizedBox(
                                          height: _height * 0.02,
                                        ),
                                        Container(
                                          height: _height * 0.3,
                                          width: _width * 0.7,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/1.png"),
                                          )),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: _height * 0.09,
                                                width: _width * 0.3,
                                                margin: const EdgeInsets.all(5),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: _height * 0.01,
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                        right: 10,
                                                      ),
                                                      child: Text(
                                                        "Temp",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: _height * 0.01,
                                                    ),
                                                    Text(
                                                        "${weatherdata.temp_c}º",
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 22,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: _height * 0.09,
                                                width: _width * 0.3,
                                                margin: const EdgeInsets.all(5),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: _height * 0.01,
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                        right: 10,
                                                      ),
                                                      child: Text(
                                                        "Wind",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: _height * 0.01,
                                                    ),
                                                    Text(
                                                        "${weatherdata.wind_kph} km/h",
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 22,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: _height * 0.09,
                                                width: _width * 0.3,
                                                margin: const EdgeInsets.all(5),
                                                decoration:
                                                    const BoxDecoration(),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: _height * 0.01,
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                        right: 10,
                                                      ),
                                                      child: Text(
                                                        "Humidity",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: _height * 0.01,
                                                    ),
                                                    Text(
                                                      "${weatherdata.humidity}",
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 14, left: 40, top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("Today",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                    "View full report",
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: _width * 0.02,
                                        ),
                                        // Text(weatherdata.forecast['forecast']['forecastday'][0]['hour']('temp_c').toString(),style: TextStyle(color: Colors.white)),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              ...weatherdata.hour.map((e) => Container(
                                                height: 70,
                                                width: 160,
                                                margin: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                   borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 50,
                                                            width: 50,
                                                          //   decoration: BoxDecoration(
                                                          //     image: DecorationImage(
                                                          //      image: NetworkImage(
                                                          //
                                                          //      );
                                                          //       fit: BoxFit.cover,
                                                          //   ),
                                                          // )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(children: [
                                                        SizedBox(
                                                          height: _height * 0.01,
                                                        ),
                                                        Text(e['time'].toString().split(" ")[1],style: TextStyle(
                                                            color: Colors.white
                                                        ),),
                                                        SizedBox(
                                                          height: _height * 0.01,
                                                        ),
                                                        Text("${e['temp_c']} °c",style: TextStyle(
                                                            color: Colors.white,
                                                          fontSize: 18,
                                                        ),)
                                                      ]),
                                                    ),
                                                  ],
                                                ),
                                              )).toList()
                                            ],
                                          ),
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
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.search,
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
                      // ListView.separated(
                      //         padding: const EdgeInsets.all(12),
                      //         itemBuilder: (context, index) => Column(
                      //           children: [
                      //             Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 IconButton(
                      //                   onPressed: () {},
                      //                   icon: const Icon(Icons.refresh,
                      //                       size: 30, weight: 20),
                      //                 ),
                      //                 Text(
                      //                   "${dateTime.day} : ${dateTime.month} : ${dateTime.year}",
                      //                   style: const TextStyle(
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: 22,
                      //                   ),
                      //                 ),
                      //                 const SizedBox(
                      //                   width: 20,
                      //                 ),
                      //                 IconButton(
                      //                   onPressed: () {},
                      //                   icon: const Icon(
                      //                     Icons.more_vert_rounded,
                      //                     weight: 20,
                      //                     size: 25,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //             Padding(
                      //               padding: const EdgeInsets.only(
                      //                 left: 5,
                      //                 right: 10,
                      //               ),
                      //               child: AnimSearchBar(
                      //                 // rtl: true,
                      //                 width: 400,
                      //                 textController:
                      //                     Provider.of<WeatherProvider>(context,
                      //                             listen: false)
                      //                         .citynamecontroller,
                      //                 onSuffixTap: () {
                      //                   setState(() {
                      //                     Provider.of<WeatherProvider>(context,
                      //                             listen: false)
                      //                         .citynamecontroller
                      //                         .clear();
                      //                   });
                      //                 },
                      //                 closeSearchOnSuffixTap: true,
                      //                 onSubmitted: (String name) {
                      //                   if (name.isNotEmpty) {
                      //                     print(name);
                      //                     Provider.of<WeatherProvider>(context,
                      //                             listen: false)
                      //                         .locationchanage(name);
                      //                   }
                      //                   // else {
                      //                   //   Provider.of<WeatherProvider>(context, listen: false).locationchanage(Provider.of<WeatherProvider>(context).location);
                      //                   // }
                      //                 },
                      //                 helpText: '  Enter City',style: TextStyle(fontWeight: FontWeight.bold),
                      //                 textFieldColor: Colors.white,
                      //               ),
                      //             ),
                      //             // InkWell(
                      //             //   onTap: () {
                      //             //     String name = Provider.of<WeatherProvider>(context, listen: false).txtcityname.text;
                      //             //     if(name.isNotEmpty){
                      //             //       print(name);
                      //             //       Provider.of<WeatherProvider>(context, listen: false).locationchanage(name);
                      //             //     }
                      //             //     // else{
                      //             //     //   Provider.of<WeatherProvider>(context, listen: false).locationchanage(Provider.of<WeatherProvider>(context).location);
                      //             //     // }
                      //             //   },
                      //             //   child: Container(
                      //             //     height: 70,
                      //             //     width: 150,
                      //             //     decoration: BoxDecoration(
                      //             //       color: Colors.blue,
                      //             //       borderRadius: BorderRadius.circular(10),
                      //             //     ),
                      //             //     alignment: Alignment.center,
                      //             //     child: Text("Submit"),
                      //             //   ),
                      //             // ),
                      //             Text("${weatherdata.name}",
                      //                 style: const TextStyle(
                      //                     fontSize: 30,
                      //                     fontWeight: FontWeight.bold)),
                      //             const SizedBox(
                      //               height: 20,
                      //             ),
                      //             const Icon(Icons.light_mode_outlined,
                      //                 size: 120),
                      //             const SizedBox(
                      //               height: 30,
                      //             ),
                      //             Text(
                      //               "${weatherdata.temp_c} º",
                      //               style: const TextStyle(
                      //                 fontSize: 40,
                      //               ),
                      //             ),
                      //             const SizedBox(
                      //               height: 30,
                      //             ),
                      //             const Row(
                      //               children: [
                      //                 // Text("${weatherdata.date}")
                      //               ],
                      //             ),
                      //             // Text("State Name : ${weatherdata.region}",
                      //             //     style: const TextStyle(
                      //             //         fontSize: 24,
                      //             //         fontWeight: FontWeight.bold)),
                      //             // const SizedBox(
                      //             //   height: 20,
                      //             // ),
                      //             // Text("Country Name : ${weatherdata.tz_id}",
                      //             //     style: const TextStyle(
                      //             //         fontSize: 24,
                      //             //         fontWeight: FontWeight.bold)),
                      //             // const SizedBox(
                      //             //   height: 20,
                      //             // ),
                      //             // Text(
                      //             //     "Date & Time : ${weatherdata.last_updated}",
                      //             //     style: const TextStyle(
                      //             //         fontSize: 24,
                      //             //         fontWeight: FontWeight.bold)),
                      //             // const SizedBox(
                      //             //   height: 20,
                      //             // ),
                      //             // Text("Temp F : ${weatherdata.temp_f}",
                      //             //     style: const TextStyle(
                      //             //         fontSize: 24,
                      //             //         fontWeight: FontWeight.bold)),
                      //             // const SizedBox(
                      //             //   height: 20,
                      //             // ),
                      //             // Text("Temp C : ${weatherdata.temp_c}",
                      //             //     style: const TextStyle(
                      //             //         fontSize: 24,
                      //             //         fontWeight: FontWeight.bold)),
                      //             // const SizedBox(
                      //             //   height: 30,
                      //             // ),
                      //           ],
                      //         ),
                      //         separatorBuilder: (context, index) => Container(),
                      //         itemCount: 1,
                      //       );
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
      ),
    );
  }
}
