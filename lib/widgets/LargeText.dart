import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const LargeText(
      {Key? key, this.size = 35, required this.text, this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
