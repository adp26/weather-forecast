class Temperature {
  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  Temperature({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temperature.fromJson(Map<dynamic, dynamic> json) {
    return Temperature(
      day: json['day']!=null?json['day'].toDouble():0,
      min: json['min']!=null?json['min'].toDouble():0,
      max: json['max']!=null?json['max'].toDouble():0,
      night: json['night']!=null?json['night'].toDouble():0,
      eve: json['eve']!=null?json['eve'].toDouble():0,
      morn: json['morn']!=null?json['morn'].toDouble():0,
 
    );
  }
   Map<String, dynamic> toMap() {
    return {
      'day': day.toDouble(),
      'min': min.toDouble(),
      'max': max.toDouble(),
      'night': night.toDouble(),
      'eve': eve.toDouble(),
      'morn': morn.toDouble(),
    };
  }
}