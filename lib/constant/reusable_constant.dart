import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final double sized;
  final FontWeight fontWeight;
  final Color colors;

  final TextAlign textAlign;
  const ReusableText({
    required this.text,
    required this.sized,
    required this.fontWeight,
    required this.colors,
    required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.dosis(
        fontSize: sized,
        fontWeight: fontWeight,
        color: colors,
      ),
    );
  }
}
