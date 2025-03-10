import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/core/constants/constants.dart';

ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

String darkModeName = 'darkMode';
//theme mode
void toggleTheme() {
  //getState
  var darkMode = Hive.box<bool>(darkModeName);

  if (darkMode.get(1)!) {
    themeNotifier.value = ThemeMode.dark;
  } else {
    themeNotifier.value = ThemeMode.light;
  }
}

class AppTheme {
  final Color backGroundColor;
  final Color primaryColor;
  final Color onPrimay;
  final Color secondary;
  final Brightness brightness;

  AppTheme.light()
      : backGroundColor = const Color(0xffEAE2F2),
        primaryColor = const Color(0xffBAA0DB),
        onPrimay = const Color(0xff4C3789),
        secondary = const Color(0xffC6C2CE),
        brightness = Brightness.light;
  AppTheme.dark()
      : backGroundColor = const Color(0xff100A1E),
        primaryColor = const Color(0xff4C3789),
        onPrimay = const Color(0xffBAA0DB),
        // ignore: use_full_hex_values_for_flutter_colors
        secondary = const Color(0xff4EAE2F2),
        brightness = Brightness.dark;

  ThemeData getTheme() {
    return ThemeData(
      //appbar theme
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: onPrimay),
        backgroundColor: primaryColor,
        foregroundColor: backGroundColor,
        titleTextStyle: TextStyle(
            color:
                themeNotifier.value == ThemeMode.dark ? Colors.white : onPrimay,
            fontSize: 20,
            fontFamily: vazir,
            fontWeight: FontWeight.bold),
      ),

      //textTheme
      textTheme: TextTheme(
        // bodyMedium: TextStyle(fontFamily: vazir, color: surfaceColor),
        bodyLarge: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, fontFamily: vazir),
        bodyMedium: TextStyle(
            fontFamily: vazir,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: themeNotifier.value == ThemeMode.dark
                ? Colors.black
                : Colors.white),
      ),

      //primary colors
      brightness: brightness,
      scaffoldBackgroundColor: backGroundColor,

      primarySwatch: Colors.purple,

      // dialog theme
      dialogBackgroundColor: const Color(0xFF4B4B4B),
      dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(fontFamily: vazir, fontSize: 16)),

      //buttom navigationbar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        unselectedIconTheme: IconThemeData(color: onPrimay),
        selectedIconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              textStyle: const WidgetStatePropertyAll<TextStyle>(
                  TextStyle(fontFamily: vazir)),
              backgroundColor: WidgetStatePropertyAll(backGroundColor))),

      //text button theme
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(primaryColor),
            backgroundColor: WidgetStatePropertyAll(backGroundColor)),
      ),

      //float action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          extendedTextStyle: const TextStyle(
              fontFamily: vazir, fontWeight: FontWeight.bold, fontSize: 16)),

      // snack bar theme
      snackBarTheme: const SnackBarThemeData(
          contentTextStyle: TextStyle(fontFamily: vazir)),

      //checkbox
      checkboxTheme: CheckboxThemeData(
          checkColor: WidgetStatePropertyAll(onPrimay),
          side: BorderSide(
              color: themeNotifier.value == ThemeMode.dark
                  ? Colors.black
                  : Colors.white)),
      //textfield
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        labelStyle: TextStyle(
            color: themeNotifier.value == ThemeMode.dark
                ? Colors.black.withOpacity(0.7)
                : Colors.white.withOpacity(0.7)),
        prefixIconColor: themeNotifier.value == ThemeMode.dark
            ? Colors.black.withOpacity(0.7)
            : Colors.white.withOpacity(0.7),
        floatingLabelStyle: TextStyle(color: primaryColor),

        // floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: onPrimay,
      ),
    );
  }
}
