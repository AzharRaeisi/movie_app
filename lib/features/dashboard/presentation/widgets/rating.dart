

import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key, required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 12.0,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          '${rating.toStringAsFixed(1)}/10 IMDb',
          style: const TextStyle(
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            letterSpacing: 0.2,
            color: Color(0xFF9C9C9C),
          ),
        ),
      ],
    );
  }
}
