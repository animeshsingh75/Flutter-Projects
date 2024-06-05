import 'package:clima/model/weather_data.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    try {
      WeatherData weather = await WeatherModel().getLocationWeather();
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LocationScreen(locationWeather: weather);
          },
        ),
      );
    } catch (e) {
      _onError(e.toString());
    }
  }

  void _onError(String error) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Location Error",
      desc: error,
      buttons: [
        DialogButton(
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              SystemNavigator.pop();
            })
      ],
      style: const AlertStyle(
        titleStyle: TextStyle(
          color: Colors.white,
        ),
        descStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
