import 'package:flutter/material.dart';

class BulletPoint extends StatelessWidget {
  final String text;
  final double width;
  final Color bulletColor;
  final Color textColor;

  const BulletPoint({
    super.key,
    required this.text,
    required this.width,
    this.bulletColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.only(top: 6, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: bulletColor,
          ),
        ),
        SizedBox(
          width: width * 0.8,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Regular",
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
