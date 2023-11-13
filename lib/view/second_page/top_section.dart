import 'package:flutter/material.dart';
import 'package:flutter_perkiraan_cuaca/constants.dart';
import 'package:flutter_perkiraan_cuaca/model/daily_weather.dart';
import 'package:flutter_perkiraan_cuaca/shared/size_config.dart';
import 'package:flutter_perkiraan_cuaca/view/second_page/second_page.dart';
import 'package:flutter_perkiraan_cuaca/view/widget/condition_weather.dart';
import 'package:flutter_perkiraan_cuaca/theme.dart';

part 'header.dart';
class TopSection extends StatelessWidget {
  final DailyWeather selectedWeather;

  final bool daily;
  final int timezoneOffset;
   final double heightBackground =  K.width*300;
   TopSection({Key? key, required this.selectedWeather, required this.timezoneOffset, required this.daily}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);


    final sizedBox = SizedBox(
                                height: MySize.scaleFactorHeight * 10,
                              );
    return Scaffold(
      body: Container(
        height: heightBackground,
        color:  backgroundColor ,
        child: Stack(
          children: [
            Container(
        
              margin: EdgeInsets.symmetric(
                  horizontal: MySize.scaleFactorWidth * 10),
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width,
              
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent, width: 0),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(53.0),
                        bottomRight: Radius.circular(53.0),
                      ),
                      color:const Color(0xFF053F8D).withOpacity(0.6),
                      shape: BoxShape.rectangle,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MySize.size13!,left:MySize.size10!,right: MySize.size10!),
              child: Container(
            
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(65.0),
                    bottomRight: Radius.circular(65.0),
                  ),
                  border: Border.all(
                      color: const Color(0XFF78D1F5).withOpacity(0.8),
                      width: 1),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF82DAF4), Color(0xFF207AF5)]),
                  shape: BoxShape.rectangle,
                ),
                height: MySize.scaleFactorHeight * 357,
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Header(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            width: MySize.scaleFactorWidth * 140,
                            height: MySize.scaleFactorHeight * 140, //160
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'assets/images/${selectedWeather.weather.first.icon}.png'),
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                convertDate(
                                    dt:selectedWeather.dt, offset: timezoneOffset),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSauceSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              sizedBox,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    selectedWeather.temp.day.toStringAsFixed(0),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'OpenSauceSans',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 40),
                                  ),
                                  const Text(
                                    "/",
                                    style: TextStyle(
                                        color: Color(0XFF71CBFB),
                                        fontFamily: 'OpenSauceSans',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        selectedWeather.temp.min.toStringAsFixed(0),
                                        style: const TextStyle(
                                            color: Color(0XFF71CBFB),
                                            fontFamily: 'OpenSauceSans',
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20),
                                      ),
                                      Container(
                                        width: MySize.scaleFactorWidth * 8,
                                        height: MySize.scaleFactorHeight * 8,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                              width:
                                                  MySize.scaleFactorWidth * 2),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                                sizedBox,
                              Text(
                                selectedWeather.weather.first.description,
                                style: const TextStyle(
                                    color: Color(0XFF71CBFB),
                                    fontFamily: K.fontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: MySize.scaleFactorHeight * 3,
                              ),
                            ],
                          ),
                        ],
                      ),
                       sizedBox,
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:K.width*20.0),
                        child: Row(
                                          
                          children: [
                            Expanded(
                              child: ConditionWeather(
                                  number:
                                      selectedWeather.windSpeed.toString() + "m/s",
                                  pathImage: "Wind",
                                  sizeImage: 31,
                                  status: "Wind"),
                            ),
                            Expanded(
                              child: ConditionWeather(
                                  number: selectedWeather.humidity.toString() + "%",
                                  pathImage: "Humadity",
                                  sizeImage: 12,
                                  status: "Humidity"),
                            ),
                            Expanded(
                              child: ConditionWeather(
                                  number: selectedWeather.clouds.toString() + "%",
                                  pathImage: "COR",
                                  sizeImage: 21,
                                  status: "Change of Rain"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MySize.scaleFactorHeight * 15,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

