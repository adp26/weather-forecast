
class WeatherDescription {
  int id;
  String main;
  String description;
  String icon;

  WeatherDescription({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDescription.fromJson(Map<dynamic, dynamic> json) {
    return WeatherDescription(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }
}
