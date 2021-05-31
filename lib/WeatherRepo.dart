import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:json_http_test/WeatherModel.dart';

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async {
    final result = await http.Client().get(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2");

    if (result.statusCode != 200) throw Exception();

    return WeatherModel.fromJson(json.decode(result.body)["main"]);
  }
}
