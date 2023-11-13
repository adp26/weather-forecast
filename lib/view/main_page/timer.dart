part of 'main_page.dart';


class UpdateTime extends StatefulWidget {
  bool reset = false;
  UpdateTime({Key? key, required this.reset}) : super(key: key);

  @override
  _UpdateTimeState createState() => _UpdateTimeState();
}

class _UpdateTimeState extends State<UpdateTime> {
  Duration duration = const Duration();

  String desTime = "";
  final addSeconds = 1;
final treshold = 60;
  runTimer() async {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      resetTimer();
      if (duration.inSeconds > treshold && duration.inMinutes < treshold) {
        setState(() {
          desTime = "Updated ${duration.inMinutes} min ago";
        });
      } else if (duration.inMinutes >= treshold) {
        setState(() {
          desTime = "Updated ${duration.inHours} hour ago";
        });
      }
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  @override
  initState() {
    super.initState();
    resetTimer();
    runTimer();
  }

  resetTimer() async {
    if (widget.reset) {
      setState(() {
        if (widget.reset) {
          duration = const Duration();
          widget.reset = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return duration.inSeconds > treshold
        ? Container(
            width: K.width * 141,
            padding: const EdgeInsets.symmetric(horizontal:7,vertical: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.white70,
                  // width: 2.0,
                  style: BorderStyle.solid,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.circle,
                  size: 8,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: K.width * 5,
                ), 
                Text(
                  desTime,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: K.fontFamily,
                      fontSize: 9,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          )
        :  SizedBox(
         height: K.height*35,
          );
  }
}
