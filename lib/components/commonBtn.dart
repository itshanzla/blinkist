import 'package:blinkist/constants/dimensions.dart';
import 'package:flutter/material.dart';

class commonBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const commonBtn({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var width = AppDimensions.screenWidth(context);
    var height = AppDimensions.screenHeight(context);
    return SizedBox(
      width: width * 0.9,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          side: WidgetStateProperty.all(
            BorderSide(color: Color(0Xff707C81), width: 1),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          backgroundColor: WidgetStateProperty.all(Color(0Xffffffff)),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Medium',
            fontSize: 16,
            color: Color(0xFF2BDE80),
          ),
        ),
      ),
    );
  }
}
