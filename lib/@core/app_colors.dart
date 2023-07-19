import 'package:flutter/material.dart';

class AppColors {
  static Buttons get buttons => const Buttons();

  static BackgroundColors get background => const BackgroundColors();

  static Fonts get fonts => const Fonts();
}

class Buttons {
  Color get red => const Color(0xFFbf140b);

  Color get blue => const Color(0xFF2a66ca);

  Color get white => const Color(0xFFFFFFFF);

  const Buttons();
}

class BackgroundColors {

  Color get backgroundWhite => const Color(0xFFFFFFFF);

  Color get backgroundBlue => const Color(0xFF2359b4);

  MaterialColor get backgroundGreen => const MaterialColor (
    0xFF239528,
    <int, Color>{
      50: Color(0xFFE2F3E4),
      100: Color(0xFFB5E0BA),
      200: Color(0xFF81CC8C),
      300: Color(0xFF4DB75D),
      400: Color(0xFF299E34),
      500: Color(0xFF239528),
      600: Color(0xFF1E8022),
      700: Color(0xFF197A1C),
      800: Color(0xFF147316),
      900: Color(0xFF0C680D),
    },
  );

  Color get backgroundBlueLight => const Color(0xff77a2fc);

  const BackgroundColors();
}

class Fonts {
  Color get darkBlue => const Color(0xFF142d56);

  Color get grey => const Color(0xFF707070);

  Color get black => const Color(0xFF000000);

  Color get white => const Color(0xFFFFFFFF);

  const Fonts();
}
