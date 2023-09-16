import 'package:expanse_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

var kColorsScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));

void main() {
  // locking the device orientation
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((func) {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer)),
      cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
    ),
    // using copywith, we get the default theme settings by flutter and we can overright selected settings
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorsScheme,
      appBarTheme: const AppBarTheme().copyWith(
          // centerTitle: true,
          backgroundColor: kColorsScheme.onPrimaryContainer,
          foregroundColor: kColorsScheme.primary),
      cardTheme: const CardTheme().copyWith(
          color: kColorsScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorsScheme.primaryContainer)),
      textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kColorsScheme.onSecondaryContainer,
              fontSize: 14)),
    ),
    // themeMode: ThemeMode.system, // default
    home: const Expenses(),
  ));
  // });
}
