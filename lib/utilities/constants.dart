import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
  color: Colors.white
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const kURL="http://'api.openweathermap.org/data/2.5/weather";
const kapikey='aeac95485426416ee18c0a4402b3d839';
const kTextfieldInputDecoration=InputDecoration(
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    filled:true,
    fillColor:Colors.white,
    hintText: "Enter city name",
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide:BorderSide.none
    )
);
