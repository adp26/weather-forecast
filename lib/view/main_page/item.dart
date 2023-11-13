part of 'main_page.dart';

class Item extends StatelessWidget {
  final int id;
  final bool colorSelected;
  final dynamic suhu;
  final String pathImage;
  final String time;
  const Item(
      {Key? key,
      required this.id,
      required this.colorSelected,
      required this.suhu,
      required this.pathImage,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<WeatherNotifier>(context, listen: false).updateList(id);
      },
      child: Container(
        decoration: BoxDecoration(
          border:
              Border.all(color: const Color(0xFF272727), width: K.width * 1),
          borderRadius: BorderRadius.circular(27.0),
          gradient: colorSelected
              ? const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFF82DAF4), Color(0xFF207AF5)])
              : const LinearGradient(
                  colors: [backgroundColor, backgroundColor]),
          shape: BoxShape.rectangle,
        ),
        margin: EdgeInsets.symmetric(horizontal: K.width * 7.0),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suhu.toStringAsFixed(0),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: K.fontFamily),
                ),
                const SizedBox(
                  width: 2,
                ),
                Container(
                  width: K.width * 5,
                  height: K.height * 7,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: K.width * 1),
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          
          
          
           Expanded(
              child: Image(
                width: K.width * 48,
                height: K.height * 48, fit: BoxFit.fill, //160
                image: AssetImage('assets/images/$pathImage.png'),
              ),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: K.fontFamily,
                color: !colorSelected ? const Color(0xFF687B92) : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class DetailWeatherDaily extends StatelessWidget {
//   final Map selected;

//   final bool daily;
//   final int timezoneOffset;
//   const DetailWeatherDaily(this.selected, this.timezoneOffset, this.daily, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     MySize().init(context);
//     Weather objSelected = Weather.fromMap(selected, daily);

//     return Scaffold(
//       body: Container(
      
//         color: const Color(0xFF010a19),
//         child: Stack(
//           children: [
//             Container(
       
//               margin: EdgeInsets.symmetric(
//                   horizontal: K.width * 10),
//               child: Center(
//                 child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: K.height * 344,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.transparent, width: 0),
//                       borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(53.0),
//                         bottomRight: Radius.circular(53.0),
//                       ),
//                       color: const Color(0xFF053F8D).withOpacity(0.6),
//                       shape: BoxShape.rectangle,
//                     )),
//               ),
//             ),
//             Container(
//                padding: EdgeInsets.only(bottom: MySize.size13!),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(65.0),
//                   bottomRight: Radius.circular(65.0),
//                 ),
//                 border: Border.all(
//                     color: const Color(0XFF78D1F5).withOpacity(0.8),
//                     width: 1),
//                 gradient: const LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [Color(0xFF82DAF4), Color(0xFF207AF5)]),
//                 shape: BoxShape.rectangle,
//               ),
//               height: K.height * 357,
//               child: SafeArea(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Row(
//                       children: [
//                         const Expanded(
//                           flex: 1,
//                           child: Image(
//                             image: AssetImage('assets/images/Group 3.png'),
//                           ),
//                         ),
//                         const Expanded(
//                           flex: 8,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.calendar_today,
//                                 size: 30,
//                                 color: Colors.white,
//                               ),
//                               Text(
//                                 // location,
//                                 " 7 Days",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: K.fontFamily,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 20),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: IconButton(
//                             onPressed: () async {},
//                             icon: const Icon(
//                               Icons.more_vert,
//                               color: Colors.white,
//                               size: 30,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image(
//                           width: K.width * 140,
//                           height: K.height * 140, //160
//                           fit: BoxFit.fill,
//                           image: AssetImage(
//                               'assets/images/${objSelected.weather!['icon']}.png'),
//                         ),
//                         Column(
//                           children: [
//                             Text(
//                               convertDate(
//                                   objSelected.dt!, timezoneOffset, daily),
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: K.fontFamily,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16),
//                             ),
//                             SizedBox(
//                               height: K.height * 10,
//                             ),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   "${objSelected.temp.toStringAsFixed(0)}",
//                                   style: const TextStyle(
//                                       color: Colors.white,
//                                       fontFamily: K.fontFamily,
//                                       fontWeight: FontWeight.w900,
//                                       fontSize: 40),
//                                 ),
//                                 const Text(
//                                   "/",
//                                   style: TextStyle(
//                                       color: Color(0XFF71CBFB),
//                                       fontFamily: K.fontFamily,
//                                       fontWeight: FontWeight.w900,
//                                       fontSize: 20),
//                                 ),
//                                 Row(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "${objSelected.tempMin.toStringAsFixed(0)}",
//                                       style: const TextStyle(
//                                           color: Color(0XFF71CBFB),
//                                           fontFamily: K.fontFamily,
//                                           fontWeight: FontWeight.w900,
//                                           fontSize: 20),
//                                     ),
//                                     Container(
//                                       width: K.width * 8,
//                                       height: K.height * 8,
//                                       decoration: BoxDecoration(
//                                         color: Colors.transparent,
//                                         border: Border.all(
//                                             color:
//                                                 Colors.white.withOpacity(0.5),
//                                             width:
//                                                 K.width * 2),
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               objSelected.weather!['description'],
//                               style: const TextStyle(
//                                   color: Color(0XFF71CBFB),
//                                   fontFamily: K.fontFamily,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 14),
//                             ),
//                             SizedBox(
//                               height: K.height * 3,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: K.height * 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: ConditionWeather(
//                               number:
//                                   objSelected.wind_speed.toString() + "m/s",
//                               pathImage: "Wind",
//                               sizeImage: 31,
//                               status: "Wind"),
//                         ),
//                         Expanded(
//                           child: ConditionWeather(
//                               number: objSelected.humidity.toString() + "%",
//                               pathImage: "Humadity",
//                               sizeImage: 12,
//                               status: "Humidity"),
//                         ),
//                         Expanded(
//                           child: ConditionWeather(
//                               number: objSelected.clouds.toString() + "%",
//                               pathImage: "COR",
//                               sizeImage: 21,
//                               status: "Change of Rain"),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: K.height * 15,
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
