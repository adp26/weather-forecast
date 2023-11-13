part of 'main_page.dart';

class TopSection extends StatelessWidget {
  final dynamic selectedWeather;
   String? timeUpdate;
   bool? reset;
   bool? daily;
  final int timezoneOffset;
   String? location;
  final double heightBackground =  K.width*475;
  TopSection(this.location, this.selectedWeather, this.timeUpdate,
      this.timezoneOffset, this.daily, this.reset,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Weather objSelected = Weather.fromMap(selected, daily!);
if(selectedWeather is HourlyWeather){
  selectedWeather as HourlyWeather;
}else{
  selectedWeather as CurrentWeather;
}
    return SizedBox(
      height: heightBackground,
  
      child: Stack(
        children: [
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: K.width * 10),
              width: MediaQuery.of(context).size.width,
              height: heightBackground,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(53.0),
                  bottomRight: Radius.circular(53.0),
                ),
                border: Border.all(color: Colors.transparent, width: 0),
                color: const Color(0xFF053F8D).withOpacity(0.6),
                shape: BoxShape.rectangle,
              )),
          Padding(
            padding: EdgeInsets.only(bottom: K.height * 6.0),
            child: Container(
              width: double.infinity,
              height: K.width*460,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(65.0),
                  bottomRight: Radius.circular(65.0),
                ),
                border: Border.all(
                    color: const Color(0XFF78D1F5).withOpacity(0.8),
                    width: K.width * 1),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF82DAF4), Color(0xFF207AF5)]),
                shape: BoxShape.rectangle,
              ),
              // height: K.height * 599,
              // decoration: BoxDecoration(border: ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Header(location: location!),
                 
                    UpdateTime(
                      reset: reset!,
                    ),
                    SizedBox(
                      width: K.width * 200,height: K.height * 180,
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/${selectedWeather.weather.first.icon}.png'),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                selectedWeather.temp.toStringAsFixed(0),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: K.fontFamily,
                                    fontSize: 60,
                                    fontWeight: FontWeight.w700),
                              ),
                              const DegreeWidget(size: 20,),
                            ],
                          ),
                          Text(
                            selectedWeather.weather.first.main,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w800,
                                fontFamily: K.fontFamily),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                           convertDate(
                                    selectedWeather.dt, timezoneOffset, daily!)
                             ,
                            style: const TextStyle(
                                color: Color(0XFF69B5FF),
                                fontFamily: K.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                   
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: K.height*5,
                          horizontal: K.width * 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
       
        ],
      ),
    );
  }
}



String convertDate(int data, int offset, bool daily) {
  dynamic dt = DateTime.fromMillisecondsSinceEpoch(data + offset);
  String dataFormat = DateFormat("EEEE, dd MMMM").format(dt).toString();
  String day = DateFormat("EEEE").format(dt).toString();
  if (daily) {
    return day;
  }
  return dataFormat;
}

