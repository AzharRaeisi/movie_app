import 'package:flutter/widgets.dart';

class AppSizes {
  static const _horizontalGap = 24.0;
  static const _verticalGap = 16.0;

  static const defaultt = EdgeInsets.symmetric(
    horizontal: _horizontalGap,
    vertical: _verticalGap,
  );

  static const horizontalSymmetric = EdgeInsets.symmetric(
    horizontal: _horizontalGap,
  );

  static EdgeInsets horizontalOnly(bool left, bool right) => EdgeInsets.only(
        left: left ? _horizontalGap : 0.0,
        right: right ? _horizontalGap : 0.0,
      );

  static const verticalSymmetric = EdgeInsets.symmetric(
    vertical: _verticalGap,
  );

  static EdgeInsets verticalOnly(bool top, bool bottom) => EdgeInsets.only(
        top: top ? _verticalGap : 0.0,
        bottom: bottom ? _verticalGap : 0.0,
      );
}
