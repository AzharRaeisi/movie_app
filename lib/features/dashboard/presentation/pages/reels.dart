import 'package:flutter/material.dart';
import 'package:movie_app/shared/theme/app_fonts.dart';

class Reels extends StatelessWidget {
  const Reels({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Reels',
        style: TextStyle(
          fontFamily: AppFonts.mulish,
          fontWeight: FontWeight.w700,
          fontSize: 14,
          letterSpacing: 0.3,
          color: Color(0xFF000000),
        ),
      ),
    );
  }
}
