import 'current_weather.dart';
import 'daily_weather.dart';
import 'hourly_weather.dart';

class WeatherModel {
  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  CurrentWeather current;
  List<HourlyWeather> hourly;
  List<DailyWeather> daily;

  WeatherModel({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  factory WeatherModel.fromJson(Map<dynamic, dynamic> json) {
    return WeatherModel(
      lat: json['lat'],
      lon: json['lon'],
      timezone: json['timezone'],
      timezoneOffset: json['timezone_offset'],
      current: CurrentWeather.fromJson(json['current']),
      hourly: (json['hourly'] as List<dynamic>)
          .map((hourlyJson) => HourlyWeather.fromJson(hourlyJson))
          .toList(),
      daily: (json['daily'] as List<dynamic>)
          .map((dailyJson) => DailyWeather.fromJson(dailyJson))
          .toList(),
    );
  }

    Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lon': lon,
      'timezone': timezone,
      'timezone_offset': timezoneOffset,
      'current': current.toMap(),
      'hourly': hourly.map((e) => e.toMap()).toList(),
      'daily': daily.map((e) => e.toMap()).toList(),
    };
  }

}
















