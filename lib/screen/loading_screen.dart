import 'package:flutter/material.dart';
import 'package:weather_chack/service/location.dart';
import 'package:weather_chack/service/networking.dart';
import 'package:weather_chack/screen/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const myApiKey = 'fec5eb4ef3cbab47c76485b00f939ec1';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    String url =
        'http://api.openweathermap.org/geo/1.0/reverse?lat=$latitude&lon=$longitude&limit=5&appid=$myApiKey';
    // 'http://api.openweathermap.org/geo/1.0/reverse?lat=37.3893889&lon=-122.0832101&limit=5&appid=fec5eb4ef3cbab47c76485b00f939ec1';

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();

    //print(weatherData[0]);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.purple,
          size: 100,
        ),
      ),
    );
  }
}
