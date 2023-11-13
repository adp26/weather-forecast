import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_perkiraan_cuaca/constants.dart';
import 'package:flutter_perkiraan_cuaca/model/current_weather.dart';
import 'package:flutter_perkiraan_cuaca/model/hourly_weather.dart';
import 'package:flutter_perkiraan_cuaca/notifier/weather_notifier.dart';
import 'package:flutter_perkiraan_cuaca/theme.dart';
import 'package:flutter_perkiraan_cuaca/view/second_page/second_page.dart';
import 'package:flutter_perkiraan_cuaca/view/widget/condition_weather.dart';
import 'package:flutter_perkiraan_cuaca/view/widget/degrees.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_perkiraan_cuaca/shared/size_config.dart';
part 'item.dart';
part 'bottom_section.dart';
part 'top_section.dart';
part 'header.dart';
part 'timer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  dynamic selectedWeather;
  int timeZoneOffset = 0 ;
  String location = K.location;
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Consumer<WeatherNotifier>(builder: (_, value, __) {
      List<HourlyWeather> hourly = value.getHourly();
      if (hourly.isEmpty) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(color: Colors.blueGrey),
          ),
        );
      }
      bool reset = true;
      


location = value.getLocation();
       timeZoneOffset = value.getTimezoneOfset();

      int idWeather = value.getId();

      if (hourly.isNotEmpty) {
        for (var val in hourly) {
          if (idWeather == hourly.indexOf(val)) {
            selectedWeather = val;
            // selected['colorSelected'] = true;
            break;
          }
        }
      } else {
        selectedWeather = value.getCurrently();
      }

      return Scaffold(
          backgroundColor: backgroundColor,
          body: RefreshIndicator(
            onRefresh: () async {
              await context.read<WeatherNotifier>().getData();
            },
            child: Container(
              color: backgroundColor,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TopSection(location, selectedWeather!,
                          K.timeUpdate, timeZoneOffset, false, reset),
                    ),
                  ),
                  const LayoutWidget(child: SevenDays()),
                  LayoutWidget(
                    child: BottomSection(
                        hourly: hourly,
                        id: idWeather,
                        timeZoneOffset: timeZoneOffset),
                  ),
                ],
              ),
            ),
          )
          // This trailing comma makes auto-formatting nicer for build methods.
          );
    });
  }
}

class LayoutWidget extends StatelessWidget {
  final Widget child;
  const LayoutWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: child,
    );
  }
}

class SevenDays extends StatelessWidget {
  const SevenDays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Today",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              fontFamily: K.fontFamily),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ChangeNotifierProvider<WeatherNotifier>(
                            create: (context) => WeatherNotifier(),
                            child: Builder(builder: (BuildContext context) {
                              return SecondPage();
                            }))));
          },
          child: const Row(
            children: <Widget>[
              Text(
                "7 days",
                style: TextStyle(
                    color: Color(0xFF687B92),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: K.fontFamily),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Color(0xFF687B92),
              )
            ],
          ),
        )
      ],
    );
  }
}

String convertToHHmm({required int data,required int offset}) {
  dynamic dt = DateTime.fromMillisecondsSinceEpoch(data * 1000);
  String dataFormat = DateFormat("HH:mm").format(dt).toString();

  return dataFormat;
}

String readTimestamp(int timestamp) {
  var now = DateTime.now();
  var format = DateFormat('HH:mm a');
  var date = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
  var diff = date.difference(now) * (-1);

  var time = '';

  if (diff.inHours > 0 && diff.inDays == 0) {
    time = format.format(date);
    return time;
  } else if (diff.inSeconds >= 0 && diff.inMinutes == 0) {
    time = diff.inSeconds.toString() + ' Detik lalu';
    return time;
  } else if (diff.inMinutes > 0 && diff.inHours == 0) {
    time = diff.inMinutes.toString() + ' Menit lalu';
    return time;
  } else {
    if (diff.inDays >= 1) {
      time = diff.inDays.toString() + ' Hari lalu';
    }
    return time;
  }
}
