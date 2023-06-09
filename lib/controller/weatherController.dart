import 'package:busmate/services/weather_services.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {
  var currentWeatherDescription = ''.obs;
  var currentWeather = ''.obs;
  @override
  void onInit() {
    fetchWeather();
    super.onInit();
  }

  void fetchWeather() async {
    var weather = await WeatherServices.fetchWeather();
    if (weather != null) {
      currentWeatherDescription.value = weather.weather[0].description;
      currentWeather.value = weather.weather[0].main;
      print(weather.weather[0].description);
      print(weather.weather[0].main);
    }
  }
}
