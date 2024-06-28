import 'package:flutter/material.dart';

class AppThemes {
  static final Map<String, ThemeData> themes = {
    "black": ThemeData(
      primaryColor: Colors.grey[800],
      scaffoldBackgroundColor: Colors.black87,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
      buttonTheme: const ButtonThemeData(
          buttonColor: Colors.black45, textTheme: ButtonTextTheme.primary),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.purple[700], // For the "=" button background color
          onSecondary: Colors.white, // For the "=" button text color
          tertiary: Color.fromARGB(69, 135, 0, 159),
          onTertiary: Colors.white),
    ),
    "black2": ThemeData(
      primaryColor: Colors.grey[800],
      scaffoldBackgroundColor: Colors.black87,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
      buttonTheme: const ButtonThemeData(
          buttonColor: Colors.black45, textTheme: ButtonTextTheme.primary),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.green[800],
        onSecondary: Colors.white,
        tertiary: Colors.grey[800],
        onTertiary: Colors.green[800],
      ),
    ),
    "gold": ThemeData(
      primaryColor: Color.fromARGB(255, 255, 210, 76),
      scaffoldBackgroundColor: Colors.black87,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(
          bodyText1: TextStyle(color: Color.fromARGB(255, 129, 91, 3))),
      buttonTheme: const ButtonThemeData(
          buttonColor: Color.fromARGB(255, 255, 210, 76),
          textTheme: ButtonTextTheme.primary),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Color.fromARGB(255, 188, 144, 35),
        onSecondary: Colors.white,
        tertiary: Color.fromARGB(255, 255, 210, 76),
        onTertiary: Color.fromARGB(255, 129, 91, 3),
      ),
    ),
    "gray": ThemeData(
      primaryColor: Colors.grey[700],
      scaffoldBackgroundColor: Colors.black87,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
      buttonTheme: const ButtonThemeData(
          buttonColor: Colors.grey, textTheme: ButtonTextTheme.primary),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.orange[500],
        onSecondary: Colors.white,
        tertiary: Colors.grey[800],
        onTertiary: Colors.white,
      ),
    ),
    "material": ThemeData(
      primaryColor: Colors.indigo[500],
      scaffoldBackgroundColor: Colors.black87,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
      buttonTheme: const ButtonThemeData(
          buttonColor: Colors.blue, textTheme: ButtonTextTheme.primary),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.orange[500],
        onSecondary: Colors.white,
        tertiary: Colors.indigo[900],
        onTertiary: Colors.white,
      ),
    ),
    "pink": ThemeData(
      primaryColor: Color.fromARGB(255, 210, 115, 146),
      scaffoldBackgroundColor: Colors.black87,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
      buttonTheme: const ButtonThemeData(
          buttonColor: Color.fromARGB(255, 196, 87, 124),
          textTheme: ButtonTextTheme.primary),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.pink[800],
        onSecondary: Colors.white,
        tertiary: Colors.pink[800],
        onTertiary: Colors.white,
      ),
    ),
    "pureblack": ThemeData(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black87,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
      buttonTheme: const ButtonThemeData(
          buttonColor: Colors.black, textTheme: ButtonTextTheme.primary),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.black,
        onSecondary: Colors.white,
        tertiary: Colors.black,
        onTertiary: Colors.white,
      ),
    ),
    "purewhite": ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.black87,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.black)),
      buttonTheme: const ButtonThemeData(
          buttonColor: Colors.white, textTheme: ButtonTextTheme.primary),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.white,
        onSecondary: Colors.black,
        tertiary: Colors.white,
        onTertiary: Colors.black,
      ),
    ),
    "white": ThemeData(
      primaryColor: Colors.white70,
      scaffoldBackgroundColor: Colors.black87,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(
          bodyText1: TextStyle(color: Color.fromARGB(255, 68, 168, 250))),
      buttonTheme: const ButtonThemeData(
          buttonColor: Colors.white70, textTheme: ButtonTextTheme.primary),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.blue[300],
        onSecondary: Colors.white,
        tertiary: Colors.blue[300],
        onTertiary: Colors.white,
      ),
    ),
  };
}
