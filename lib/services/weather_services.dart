import 'package:http/http.dart' as http;
import 'package:busmate/model/weather.dart';

class WeatherServices {
  static var client = http.Client();

  static Future<Weather?> fetchWeather() async {
    var response = await client.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=10&lon=76&appid=d87cc74e42d6ac7743dbefe2a9891139'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return weatherFromJson(jsonString);
    } else {
      // Code to handle error when fetching weather from the API
      return null;
    }
  }
}
