import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  const ModifiedText({
    Key? key,
    required this.text,
    required this.coloor,
    required this.size,
  }) : super(key: key);

  final String text;
  final Color coloor;
  final double size;

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Text(
      text,
      style: TextStyle(
        color: coloor,
        fontSize: size,
      ),
    );
  }
}
