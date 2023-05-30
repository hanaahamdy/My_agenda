import 'package:flutter/material.dart';
import 'package:my_agenda/core/utils/colors.dart';
ThemeData appTheme(){
  return ThemeData(floatingActionButtonTheme:const FloatingActionButtonThemeData(backgroundColor: teal),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: teal,foregroundColor: white)),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}
