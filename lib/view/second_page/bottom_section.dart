
part of 'second_page.dart';

class BottomSection extends StatelessWidget {
  final int timeZoneOffset;
  final List data;
  const BottomSection(
      {Key? key, required this.timeZoneOffset, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
//     List<String> days=[];
//     List conditions=[];
//     List temperatures=[];
 

//     for(DailyWeather daily in data){
//       if(data.last==daily){
//         break;
//       }
// days.add(convertDate(dt:daily.dt,offset:timeZoneOffset, ));
// temperatures.add([daily.temp.max.toString(),daily.temp.min.toString()]);

// conditions.add([daily.weather.first.main,daily.weather.first.icon]);
//     }

    return Container(
      // height: 370,
      width: double.infinity,
      height: K.height * 450,
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
          horizontal: K.width * 40, vertical: K.height * 10),
      child: 
//       Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: 
      
//       [
// Expanded(child: NameOfDays(days:days)),
// Expanded(child: Conditions(conditions: conditions,)),
// Expanded(child: Temperatures(temperatures:temperatures)),
//       ],)
      
      


      ListView.builder( physics: const BouncingScrollPhysics(),
          itemCount: data.length,
          shrinkWrap: false,
          itemBuilder: ((context, index) {
            DailyWeather val = data[index];

            return Item(
        
                id: index,
                main: val.weather.first.main.toString(),
                suhuMin: val.temp.min.toString(),
                suhuMax: val.temp.max.toString(),
                pathImage: val.weather.first.icon,
                time: convertDate(dt:val.dt,offset:timeZoneOffset, ));
          })),
    );
  }
}

class NameOfDays extends StatelessWidget {
  final List<String> days;
  const NameOfDays({Key? key,required this.days}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> daysWidget =[];
    for(String day in days){
      daysWidget.add(Text(day,   style: fontStyleSecond2,));
  
    }
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: daysWidget,);
  }
}

class Conditions extends StatelessWidget {
   final List conditions;
  const Conditions({Key? key, required this.conditions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     List<Widget> conditionsWidget =[];
      for(List con in conditions){
      conditionsWidget.add(Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                width: K.width * 50,
                height: K.height * 50, fit: BoxFit.fill, //160
                image: AssetImage('assets/images/${con[1]}.png'),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                con[0],
                style: fontStyleSecond2,
              ),
            ],
          ),);
  
    }
    return Column(crossAxisAlignment:CrossAxisAlignment.start,
      children: conditionsWidget,
    );
  }
}

class Temperatures extends StatelessWidget {
   final List temperatures;
  const Temperatures({Key? key, required this.temperatures}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      List<Widget> TemperaturesWidget =[];
      for(List temp in temperatures){
      TemperaturesWidget.add(Row(
            children: [
              Text(
                "+" + temp[0].substring(0, 2) + K.degrees,
                style: fontStyleSecond1,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                "+" + temp[1].substring(0, 2) + K.degrees,
                style: fontStyleSecond2,
              ),
            ],
          ),);
  
    }
     return Column(
      // crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: TemperaturesWidget,
    );
  }
}