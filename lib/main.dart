import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/contoller/provider/appthemeprovider.dart';
import 'package:weather_app/contoller/provider/weather_provider.dart';
import 'package:weather_app/models/appthememodel.dart';
import 'package:weather_app/utils/apptheme.dart';
import 'package:weather_app/views/screens/forecast_report_page.dart';
import 'package:weather_app/views/screens/homepage.dart';
import 'contoller/provider/connectivty_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  

  bool isdark = prefs.getBool('apptheme') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppThemeProvider(
            appThemeModel: AppThemeModel(
              isDark: isdark,
            ),
          ),
        ),

        ChangeNotifierProvider(create: (context) => ConnectivityProvider(),),
        ChangeNotifierProvider(create: (context) => WeatherProvider(),),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lighttheme,
        darkTheme: AppTheme.Darktheme,
        themeMode: (Provider.of<AppThemeProvider>(context).appThemeModel.isDark ==
            false)
            ? ThemeMode.light
            : ThemeMode.dark,
        routes: {
          '/': (context) => HomePage(),
          'forecast': (context) => Forecast_page(),
        },
      ),
    ),
  );
}
