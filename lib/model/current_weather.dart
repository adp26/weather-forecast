
import 'weather_description.dart';

class CurrentWeather {
  int dt;
  int sunrise;
  int sunset;
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
  List<WeatherDescription> weather;

  CurrentWeather({
    required this.dt,
    required this.sunrise,
    required this.sunset,
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
    required this.weather,
  });

  factory CurrentWeather.fromJson(Map<dynamic, dynamic> json) {
    return CurrentWeather(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
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
      weather: (json['weather'] as List<dynamic>)
          .map((weatherJson) => WeatherDescription.fromJson(weatherJson))
          .toList(),
    );
  }
  Map<String, dynamic> toMap() {
     return {
      'dt': dt,
      'sunrise': sunrise,
      'sunset': sunset,
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
      'weather': weather.map((e) => e.toMap()).toList(),
    };
  }
  
}
