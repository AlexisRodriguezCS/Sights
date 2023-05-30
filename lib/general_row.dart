import 'package:flutter/material.dart';

class GeneralRow extends StatelessWidget {
  static const String boxColor = "0xff161a1d";
  static const String textColor = "0xffEEEEEE";
  final String imagePath;
  final String title;
  final String address;

  const GeneralRow({
    required this.imagePath,
    required this.title,
    required this.address,
    required Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      margin: const EdgeInsets.only(left: 15.0, right: 15.0),
      height: 160.0,
      decoration: BoxDecoration(
        color: Color(int.parse(boxColor)),
        boxShadow:  [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 100.0,
            height: 125.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage(imagePath),
              ),
              boxShadow:  [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Color(int.parse(textColor)),
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                address,
                style:  TextStyle(
                  fontSize: 18.0,
                  color: Color(int.parse(textColor)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
