part of 'main_page.dart';

class BottomSection extends StatelessWidget {
  final List<HourlyWeather> hourly;
  final int id;
  final int timeZoneOffset;
  const BottomSection(
      {Key? key,
      required this.hourly,
      required this.id,
      required this.timeZoneOffset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: K.height * 130,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hourly.length,
          itemBuilder: ((context, index) {
            bool selected = false;
            if (index == id) {
              selected = true;
            }
            var value = hourly[index];
          
            return Item(
                id: index,
                colorSelected: selected,
                suhu: value.temp,
                pathImage: value.weather.first.icon,
                time: convertToHHmm(offset: timeZoneOffset,data:value.dt));
          })),
    );
  }
}
