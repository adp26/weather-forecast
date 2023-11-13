

import 'package:flutter_perkiraan_cuaca/model/weather_description.dart';

import 'temperature.dart';

class DailyWeather {
  int dt;
  int sunrise;
  int sunset;
  int moonrise;
  int moonset;
  double moonPhase;
  Temperature temp;
  Temperature feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double windSpeed;
  int windDeg;
  double windGust;
  List<WeatherDescription> weather;
  int clouds;
  double pop;
  double rain;
  dynamic uvi;

  DailyWeather({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.uvi,
  });

  factory DailyWeather.fromJson(Map<dynamic, dynamic> json) {
    return DailyWeather(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonset: json['moonset'],
      moonPhase: json['moon_phase'].toDouble(),
      temp: Temperature.fromJson(json['temp']),
      feelsLike: Temperature.fromJson(json['feels_like']),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'].toDouble(),
      windSpeed: json['wind_speed'].toDouble(),
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'].toDouble(),
      weather: (json['weather'] as List<dynamic>)
          .map((weatherJson) => WeatherDescription.fromJson(weatherJson))
          .toList(),
      clouds: json['clouds'],
      pop: json['pop'].toDouble(),
      rain: json['rain'].toDouble(),
      uvi: json['uvi'],
    );
  }
   Map<String, dynamic> toMap() {
    return {
      'dt': dt,
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'moon_phase': moonPhase,
      'temp': temp.toMap(),
      'feels_like': feelsLike.toMap(),
      'pressure': pressure,
      'humidity': humidity,
      'dew_point': dewPoint,
      'wind_speed': windSpeed,
      'wind_deg': windDeg,
      'wind_gust': windGust,
      'weather': weather.map((e) => e.toMap()).toList(),
      'clouds': clouds,
      'pop': pop,
      'rain': rain,
      'uvi': uvi,
    };
  }
}


