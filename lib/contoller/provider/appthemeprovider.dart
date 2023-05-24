import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/appthememodel.dart';

class AppThemeProvider extends ChangeNotifier{
  AppThemeModel appThemeModel;

   AppThemeProvider({required this.appThemeModel});


   void ChangeTheme()async{
     appThemeModel.isDark = ! appThemeModel.isDark;
     SharedPreferences prefs = await SharedPreferences.getInstance();

     prefs.setBool('apptheme', appThemeModel.isDark);
     notifyListeners();
   }
}