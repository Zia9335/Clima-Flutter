import 'networking.dart';
import 'location.dart';

const  apikey ='aeac95485426416ee18c0a4402b3d839';
class WeatherModel {

  Future<dynamic> GetWeatherCity(String cityname)async{
    var url="http://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey&units=metric";
    NetworkHelper networkHelper =NetworkHelper(url);
    var weatherData= await networkHelper.getdata();
    return weatherData;
  }

  Future<dynamic> GetWeatherLocation()async {
    Location location = Location();
    await location.getCurrentLocation();

    print(location.latitude);
    print(location.longitude);
    NetworkHelper networkhelperobj = NetworkHelper(
        "http://api.openweathermap.org/data/2.5/weather?lat=${location
            .latitude}&lon=${location.longitude}&appid=$apikey&units=metric");

    var jsondata = await networkhelperobj.getdata();

    return jsondata;
  }



  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return "It's 🍦 time";
    } else if (temp > 20) {
      return "Time for shorts and 👕";
    } else if (temp < 10) {
      return "You'll need 🧣 and 🧤";
    } else {
      return "Bring a 🧥 just in case";
    }
  }
}
