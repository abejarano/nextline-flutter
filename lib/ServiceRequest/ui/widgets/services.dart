import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends StatefulWidget {
  final int id;
  final String name;

  const Services({Key key, @required this.id, this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Services();
  }
}

class _Services extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
        SharedPreferences prefs = await _prefs;
        await  prefs.setInt('service', widget.id);
        Navigator.pushNamed(context, '/select-internet-plan');
      },
      child: Container(
        padding: EdgeInsets.only(top: 18, bottom: 18, left: 20, right: 20),
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
            border:
                Border.all(width: 2.0, color: Color.fromRGBO(82, 192, 242, 1)),
            borderRadius: BorderRadius.circular(22),
            color: Colors.white),
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Text(
                widget.name,
                style: TextStyle(
                    fontFamily: "fontSubTitle",
                    fontSize: 20,
                    color: Color.fromRGBO(0, 109, 186, 1)),
              ),
            ),
            Expanded(
                flex: 4,
                child: SvgPicture.asset(
                    "assets/images/${widget.name.toLowerCase()}.svg",
                    color: Color.fromRGBO(0, 109, 186, 1)))
          ],
        ),
      ),
    );
  }
}
