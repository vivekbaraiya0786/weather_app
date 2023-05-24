import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class APIHelper{
  APIHelper._();    //private named constructor
  static final APIHelper apiHelper = APIHelper._();

  Future<WeatherModel?> fetchweather(String locationame)async{
    String baseurl = "http://api.weatherapi.com/v1/forecast.json?key=946a9f81fd14436d97f134801232105&q=$locationame&aqi=no";
    http.Response res = await http.get(Uri.parse(baseurl));
    if(res.statusCode == 200){
      String data = res.body;
      Map  decoddata = jsonDecode(data);
      WeatherModel weatherdata = WeatherModel.frommap(data: decoddata);
      return weatherdata;
    }
  }
}


