import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double fontSize;
  final Color textColor;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  const CustomOutlinedButton({super.key, 
    required this.onPressed,
    required this.text,
    this.fontSize = 14.0,
    this.textColor = Colors.lightBlueAccent,
    this.borderRadius = 10.0,
    this.borderColor = Colors.lightBlueAccent,
    this.borderWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(
          width: borderWidth,
          color: borderColor,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
