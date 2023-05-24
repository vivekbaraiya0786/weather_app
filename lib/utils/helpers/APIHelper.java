// //singleton class
//
// class APIHelper{
//   APIHelper._();    //private and named constructor
//   static final APIHelper apiHelper = APIHelper._();
//
//   void disp(){
//     print("Disp from class");
//   }
// }


import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ramcharitmanas/model/album_model.dart';

class APIHelper{
  APIHelper._();    //private named constructor
  static final APIHelper apiHelper = APIHelper._();

  Future<Album?> fetchalbum()async{
    String baseurl = "https://jsonplaceholder.typicode.com";
    String endpoint = "/albums/10";

    String api = baseurl + endpoint;

    http.Response res = await http.get(Uri.parse(api));

    if(res.statusCode == 200){
      String data = res.body;

      Map decoddata = jsonDecode(data);

      Album album = Album.frommap(data: decoddata);

      return album;
    }
  }
}
