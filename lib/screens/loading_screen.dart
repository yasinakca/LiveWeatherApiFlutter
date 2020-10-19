import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/netwotking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String url = "http://api.openweathermap.org/data/2.5/weather?";
const String apiKey = "81d2503e180cd9dd6b53484c2d8254c0";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async{
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper("${url}lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();  //dynamic

    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: weatherData,)));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:SpinKitDoubleBounce(
          color: Colors.white,
          size: 60.0,
        )
      ),
    );
  }
}

