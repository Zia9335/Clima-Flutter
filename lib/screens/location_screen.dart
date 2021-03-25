import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/screens/city_screen.dart';
class LocationScreen extends StatefulWidget {
    LocationScreen({this.weatherdata});
  final weatherdata;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temprature;
  String city;
  String weatherIcon;
  String Massage;
  WeatherModel weatherModel=WeatherModel();
  @override

  void initState() {
    super.initState();
    updateUI(widget.weatherdata);
  }
  updateUI(dynamic weatherData){
    setState(() {
      if(weatherData==null){
        temprature=0;
        weatherIcon='Error';
        Massage='unable to connect';
        city='';
        return;
      }
      double temp =weatherData['main']['temp'];
      temprature=temp.toInt();
      city =weatherData['name'];
      weatherIcon=weatherModel.getWeatherIcon(weatherData['weather'][0]['id']);
      Massage=weatherModel.getMessage(temprature);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{
                      updateUI(await weatherModel.GetWeatherLocation());
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                      var typedname=await Navigator.push(context, MaterialPageRoute(builder: (context){return
                          CityScreen();},),);
                      if (typedname!=null){
                            updateUI(await weatherModel.GetWeatherCity(typedname));
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temprature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$Massage in $city!",

                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
