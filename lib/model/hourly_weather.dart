
import 'package:flutter_perkiraan_cuaca/model/weather_description.dart';

import 'rain.dart';

class HourlyWeather {
  int dt;
  double temp;
  double feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  dynamic uvi;
  int clouds;
  int visibility;
  double windSpeed;
  int windDeg;
  double windGust;
  List<WeatherDescription> weather;
  double pop;
  dynamic rain;
  HourlyWeather({ this.rain,
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
  });

  factory HourlyWeather.fromJson(Map<dynamic, dynamic> json) {
    dynamic convRain;
    if(json['rain']!=null){
    if(json['rain'].runtimeType==Map){
convRain = Rain.fromJson(json['rain']);
    }else{
      convRain =json['rain'];
    }
    
    }
    return HourlyWeather(
      dt: json['dt'],
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'].toDouble(),
      uvi: json['uvi'],
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'].toDouble(),
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'].toDouble(),
      weather: (json['weather'] as List<dynamic>)
          .map((weatherJson) => WeatherDescription.fromJson(weatherJson))
          .toList(),
      pop: json['pop'].toDouble(),
       rain: convRain
    );
  }
  Map<String, dynamic> toMap() {
     dynamic convRain;
    if(rain!=null){
    if(rain.runtimeType==Map){
convRain = rain.toMap();
    }else{
      convRain =rain;
    }
    }
    return {
      'dt': dt,
      'temp': temp,
      'feels_like': feelsLike,
      'pressure': pressure,
      'humidity': humidity,
      'dew_point': dewPoint,
      'uvi': uvi,
      'clouds': clouds,
      'visibility': visibility,
      'wind_speed': windSpeed,
      'wind_deg': windDeg,
      'wind_gust': windGust,
      'weather': weather.map((e) => e.toMap()).toList(),
      'pop': pop,
      'rain':convRain,
    };
  
  }
}
