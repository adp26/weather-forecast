
class Rain {
  dynamic oneHour;

  Rain({required this.oneHour});

  factory Rain.fromJson(Map<dynamic, dynamic> json) {
    return Rain(
      oneHour: json['1h'],
    );
  }
   Map<String, dynamic> toMap(rain) {
    return {
      '1h': oneHour,
    };
  }
}
