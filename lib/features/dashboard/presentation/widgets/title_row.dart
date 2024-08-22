
import 'package:flutter/material.dart';
import 'package:movie_app/shared/theme/app_fonts.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({
    super.key,
    required this.title,
    required this.onSeeMoreTap,
  });

  final String title;
  final VoidCallback onSeeMoreTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: AppFonts.merriweather,
            fontWeight: FontWeight.w900,
            fontSize: 16,
            letterSpacing: 0.3,
            color: Color(0xFF110E47),
          ),
        ),
        GestureDetector(
          onTap: onSeeMoreTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE5E4EA)),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Text(
              'See more',
              style: TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w400,
                fontSize: 10,
                letterSpacing: 0.2,
                color: Color(0xFFAAA9B1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
