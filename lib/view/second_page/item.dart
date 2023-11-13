part of 'second_page.dart';

class Item extends StatelessWidget {
  final int id;
  final String suhuMax;
  final String suhuMin;
  final String main;
  final String pathImage;
  final String time;
  const Item(
      {Key? key,
      required this.id,
      required this.main,
      required this.pathImage,
      required this.suhuMax,
      required this.suhuMin,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      width: K.width * 40,
    );
    return InkWell(
      onTap: () {
        Provider.of<WeatherNotifier>(context, listen: false).updateList(id);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              time,
              style: fontStyleSecond2,
            ),
          ),
          sizedBox,
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  width: K.width * 50,
                  height: K.height * 50,
                   fit: BoxFit.cover, //160
                  image: AssetImage('assets/images/$pathImage.png'),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  main,
                  style: fontStyleSecond2,
                ),
              ],
            ),
          ),
          sizedBox,
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Text(
                  "+" + suhuMax.substring(0, 2) + K.degrees,
                  style: fontStyleSecond1,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  "+" + suhuMin.substring(0, 2) + K.degrees,
                  style: fontStyleSecond2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
