import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  const LocationScreen({Key? key, this.locationWeather}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double temperature;
  late int condition;
  late String cityName;

  @override
  void initState() {
    super.initState();

    updateUi(widget.locationWeather);
    // print(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    // temperature = weatherData[0]['main']['temp'];
    // condition = weatherData[0]['weather'][0]['id'];
    cityName = weatherData[0]['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$cityName',
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
