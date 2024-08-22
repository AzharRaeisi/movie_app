import 'package:flutter/material.dart';
import 'package:movie_app/shared/theme/app_fonts.dart';
import 'package:movie_app/shared/theme/app_sizes.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    this.title,
    required this.leftIconPath,
    this.onLeftIconTap,
    this.rightIconPath,
    this.onRightIconTap,
  });

  final String? title;
  final String leftIconPath;
  final VoidCallback? onLeftIconTap;
  final String? rightIconPath;
  final VoidCallback? onRightIconTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSizes.horizontalSymmetric,
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: onLeftIconTap, child: Image.asset(leftIconPath)),
          if (title != null)
            Text(
              title!,
              style: const TextStyle(
                fontFamily: AppFonts.merriweather,
                fontWeight: FontWeight.w900,
                fontSize: 16,
                letterSpacing: 0.3,
                color: Color(0xFF110E47),
              ),
            ),
          if (rightIconPath != null)
            GestureDetector(
                onTap: onRightIconTap, child: Image.asset(rightIconPath!)),
        ],
      ),
    );
  }
}
