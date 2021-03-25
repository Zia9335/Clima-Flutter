import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';




class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    getLocation();
    super.initState();
  }


  getLocation()async{


    var jsonData=await WeatherModel().GetWeatherLocation();

    Navigator.push(context, MaterialPageRoute(builder: (context){return LocationScreen(weatherdata:jsonData);}));



  }


  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color:  Colors.lightBlueAccent,
          size: 80.0,
        ),
      ),
    );
  }
}
