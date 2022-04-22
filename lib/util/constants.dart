import 'package:flutter/widgets.dart';

class UniformScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}

class FontSizes {
  static const heading = 22.0;
  static const headingSmall = 16.0;
  static const headingLarge = 28.0;
  static const headingLargeLarge = 68.0;
  static const body = 12.0;
  static const bodyLarge = 14.0;
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}