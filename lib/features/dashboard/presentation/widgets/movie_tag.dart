import 'package:flutter/material.dart';
import 'package:movie_app/shared/theme/app_fonts.dart';

class MovieTag extends StatelessWidget {
  const MovieTag({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xFFDBE3FF),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Text(
        tag.toUpperCase(),
        style: const TextStyle(
            fontFamily: AppFonts.mulish,
            fontWeight: FontWeight.w700,
            fontSize: 8,
            letterSpacing: 0.2,
            color: Color(0xff88A4E8)),
      ),
    );
  }
}
