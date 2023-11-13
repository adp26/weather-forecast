part of 'top_section.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

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
        const Expanded(
          flex: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Icon(
                Icons.calendar_today,
                size: 30,
                color: Colors.white,
              ),
              Text(
                // location,
                " 7 Days",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSauceSans',
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
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