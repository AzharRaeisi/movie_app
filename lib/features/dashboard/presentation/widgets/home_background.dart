
import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 35% of the screen height
        Expanded(
          flex: 35,
          child: Container(
            color: const Color(0xffF9F9FA),
          ),
        ),
        // 65% of the screen height
        Expanded(
          flex: 65,
          child: Container(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
