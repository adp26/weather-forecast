import 'package:flutter_perkiraan_cuaca/constants.dart';
import 'package:flutter_perkiraan_cuaca/repository/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_perkiraan_cuaca/model/current_weather.dart';
import 'package:flutter_perkiraan_cuaca/model/daily_weather.dart';
import 'package:flutter_perkiraan_cuaca/model/hourly_weather.dart';
import 'package:flutter_perkiraan_cuaca/model/weather_model.dart';
import 'package:geolocator/geolocator.dart';

import 'package:hive/hive.dart';

import '../repository/weather_api.dart';

class WeatherNotifier extends ChangeNotifier {
  CurrentWeather? currently;
  Map allData = {};
  WeatherModel? weatherModel;
  List<DailyWeather> daily = [];
  List<HourlyWeather> hourly = [];
  String location = K.location;
  int idWeather = 0;
  int timeZoneOfset = 0;

  WeatherNotifier() {
    init();
  }

  init() async {
    await getData();
  }

  getCurrently() => currently;

  getAlldata() => allData;
  getHourly() => hourly;
  getDaily() => daily;
  getTimezoneOfset() => timeZoneOfset;
  getId() => idWeather;
  getLocation() => location;

  Future<void> getData() async {
    await getWeatherAPI();
    var addBox = Hive.box("box_weather");
    if (addBox.isOpen) {
      if (addBox.isNotEmpty) {
        weatherModel = WeatherModel.fromJson(addBox.get('data'));

        hourly = weatherModel!.hourly;
        daily = weatherModel!.daily;
        currently = weatherModel!.current;
        timeZoneOfset = weatherModel!.timezoneOffset;
      }
    }
    notifyListeners();
  }

  Future<void> getWeatherAPI() async {
    final locationApi = LocationAPI();

    Map<String, dynamic> data = {};

    var addBox = Hive.box("box_weather");

    Position? _locationData = await locationApi.coordinateLocation();
    location = await locationApi.nameLocation();
    
    
    if (_locationData!.latitude != 0) {
      final getWeather = GetWeather();

      data = await getWeather.getWeather(
          _locationData.latitude, _locationData.longitude);

      if (!data.containsKey("error")) {
        //add to local storage

        if (addBox.isOpen) {
          addBox.put('data', WeatherModel.fromJson(data).toMap());
        }
      } else {
        // if (openBox.isOpen) {
        //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //       duration: Duration(seconds: 1),
        //       content: Text("you are offline")));
        //   if (openBox.isNotEmpty) {
        //     data = openBox.get("data");
        //   }
        // }
      }
    }
  }

  updateList(int id) async {
    if (idWeather == id) {
      idWeather = 999;
    } else {
      idWeather = id;
    }

    notifyListeners();
  }
}
