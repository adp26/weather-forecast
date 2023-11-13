part of 'main_page.dart';

class Header extends StatelessWidget {
   Header({
    Key? key,
    required this.location,
  }) : super(key: key);

   String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Image(
            image: AssetImage('assets/images/Group 3.png'),
          ),
        ),
        Expanded(
          flex: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_pin,
                size: 30,
                color: Colors.white,
              ),
              Text(
                location,
               
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: K.fontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 22),
              ),
            ],
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () async {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
