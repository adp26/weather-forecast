import 'package:flutter/material.dart';
import 'package:flutter_perkiraan_cuaca/constants.dart';
import 'package:flutter_perkiraan_cuaca/model/daily_weather.dart';
import 'package:flutter_perkiraan_cuaca/notifier/weather_notifier.dart';
import 'package:flutter_perkiraan_cuaca/theme.dart';
import 'package:flutter_perkiraan_cuaca/view/second_page/top_section.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
part 'bottom_section.dart';
part 'item.dart';

// ignore: must_be_immutable
class SecondPage extends StatelessWidget {
  dynamic selectedWeather; //daily
// DailyWeather daily;
// int timeZoneOffset;
// int id;
//id, daily,timezoneoffset,
  //  SecondPage({Key? key,required this.id,required this.selectedWeather, required this.timeZoneOffset, required this.daily}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherNotifier>(
      builder: (_, value, __) {
        List<DailyWeather> daily = value.getDaily();
        int timeZoneOffset = value.getTimezoneOfset();

        int idWeather = value.getId();
        if (daily.isNotEmpty) {
          if (idWeather != 999) {
            for (var val in daily) {
              if (idWeather == daily.indexOf(val)) {
                selectedWeather = val;

                break;
              }
            }
          } else {
            selectedWeather = daily[0];
          }
        }

        return selectedWeather != null
            ? MediaQuery(
               data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: Scaffold(
                  body: Column(
                  children: [
                    Expanded(
                      child: TopSection(
                          selectedWeather: selectedWeather,
                          timezoneOffset: timeZoneOffset,
                          daily: true),
                    ),
                    BottomSection(
                      timeZoneOffset: timeZoneOffset,
                      data: daily,
                    ),
                  ],
                )
                  // This trailing comma makes auto-formatting nicer for build methods.
                  ),
            )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              );
      },
    );
  }
}

String convertDate({required int dt,required int offset}) {
 
  dynamic date = DateTime.fromMillisecondsSinceEpoch(dt * 1000,isUtc: true);
  String day = DateFormat("EEE").format(date).toString();
  return day;
}
