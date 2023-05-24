class WeatherModel {
  Map location;
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String tz_id;
  int localtime_epoch;
  String localtime;
  Map current;
  int last_updated_epoch;
  String last_updated;
  double temp_c;
  double temp_f;
  int is_day;
  Map condition;
  String text;
  // String icon;
  int code;
  double wind_mph;
  double wind_kph;
  int wind_degree;
  String wind_dir;
  double pressure_mb;
  double pressure_in;
  double precip_mm;
  double precip_in;
  int humidity;
  int cloud;
  double feelslike_c;
  double feelslike_f;
  double vis_km;
  double vis_miles;
  double uv;
  double gust_mph;
  double gust_kph;
  List hour;
  String time;
  double temp;
  // String icon;



  WeatherModel({
    required this.location,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tz_id,
    required this.localtime_epoch,
    required this.localtime,
    required this.current,
    required this.last_updated_epoch,
    required this.last_updated,
    required this.temp_c,
    required this.temp_f,
    required this.is_day,
    required this.condition,
    required this.text,
    // required this.icon,
    required this.code,
    required this.wind_mph,
    required this.wind_kph,
    required this.wind_degree,
    required this.wind_dir,
    required this.pressure_mb,
    required this.precip_in,
    required this.precip_mm,
    required this.pressure_in,
    required this.humidity,
    required this.cloud,
    required this.feelslike_c,
    required this.feelslike_f,
    required this.vis_km,
    required this.vis_miles,
    required this.uv,
    required this.gust_mph,
    required this.gust_kph,
    required this.time,
    required this.hour,
required this.temp,
// required this.icon,


  });

  factory WeatherModel.frommap({required Map data}){
    return WeatherModel(
      location: data['location'],
      name: data['location']['name'],
      region: data['location']['region'],
      country: data['location']['country'],
      lat: data['location']['lat'],
      lon: data['location']['lon'],
      tz_id: data['location']['tz_id'],
      localtime_epoch: data['location']['localtime_epoch'],
      localtime: data['location']['localtime'],
      current: data['current'],
      last_updated_epoch: data['current']['last_updated_epoch'],
      last_updated: data['current']['last_updated'],
      temp_c: data['current']['temp_c'],
      temp_f: data['current']['temp_f'],
      is_day: data['current']['is_day'],
      condition: data['current']['condition'],
      text: data['current']['condition']['text'],
      code: data['current']['condition']['code'],
      wind_mph: data['current']['wind_mph'],
      wind_kph: data['current']['wind_kph'],
      wind_degree: data['current']['wind_degree'],
      wind_dir: data['current']['wind_dir'],
      pressure_mb: data['current']['pressure_mb'],
      pressure_in: data['current']['pressure_in'],
      precip_mm: data['current']['precip_mm'],
      precip_in: data['current']['precip_in'],
      humidity: data['current']['humidity'],
      cloud: data['current']['cloud'],
      feelslike_c: data['current']['feelslike_c'],
      feelslike_f: data['current']['feelslike_f'],
      vis_km: data['current']['vis_km'],
      vis_miles: data['current']['vis_miles'],
      uv: data['current']['uv'],
      gust_mph: data['current']['gust_mph'],
      gust_kph: data['current']['gust_kph'],
      // temp0: data['forecast']['forecastday'][0]['hour'][0]['temp_c'],
      hour: data['forecast']['forecastday'][i]['hour'],
      time: data['forecast']['forecastday'][i]['hour'][i]['time'],
      temp: data['forecast']['forecastday'][i]['hour'][i]['temp_c'],
      // temp: data['forecast']['forecastday'][i]['hour'][i]['temp_c'],
      // icon: data['forecast']['forecastday'][i]['hour'][i]['condition']['icon'],


    );
  }
}

int i =0;