import 'package:busmate/services/weather_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {
  var isloading = true.obs;
  var currentWeatherDescription = ''.obs;
  var currentWeather = ''.obs;
  var temperature = 0.00.obs;
  var weatherId = 100.obs;
  Rx<AssetImage> weatherIcon = const AssetImage('./assets/error.png').obs;
  @override
  void onInit() {
    fetchWeather();
    weatherIcon.obs;
    super.onInit();
  }

  void fetchWeather() async {
    try {
      isloading(true);
      var weather = await WeatherServices.fetchWeather();
      if (weather != null) {
        currentWeatherDescription.value = weather.weather[0].description;
        currentWeather.value = weather.weather[0].main;
        weatherId.value = weather.weather[0].id;
        weatherIcon.value = getWeatherIcon();
        temperature.value = weather.main.temp - 273.15;
      }
    } finally {
      isloading(false);
    }
  }

  //function to display weather icon based on weather id , the possible weather are [Group 2xx: Thunderstorm,Group 3xx: Drizzle,Group 5xx: Rain,Group 6xx: Snow,Group 7xx: Atmosphere,Group 800: Clear
  AssetImage getWeatherIcon() {
    if (weatherId.value < 300) {
      return const AssetImage('./assets/thunderstorm-icon.png');
    } else if (weatherId.value < 400) {
      return const AssetImage('./assets/drizzle-icon.png');
    } else if (weatherId.value < 600) {
      return const AssetImage('./assets/rainy-icon.png');
    } else if (weatherId.value < 700) {
      return const AssetImage('./assets/snow-icon.png');
    } else if (weatherId.value < 800) {
      return const AssetImage('./assets/mist-icon.png');
    } else if (weatherId.value == 800) {
      return const AssetImage('./assets/sun-icon.png');
    } else if (weatherId.value < 805) {
      return const AssetImage('./assets/cloudy-icon.png');
    } else {
      return const AssetImage('./assets/weatherError-icon.png');
    }
  }
}
