import 'package:flutter/material.dart';

const List<Color> appColorList = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.teal,
  Colors.pink,
  Colors.amber,
  Colors.brown,
  Colors.cyan,
  Colors.deepPurple,
  Colors.indigo,
  Colors.lime,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.deepOrange,
  Colors.grey,
  Colors.blueGrey,
];

class AppTheme {
  final int selectedColor;
  final Brightness brightness;

  AppTheme({this.selectedColor = 0, this.brightness = Brightness.light})
    : assert(selectedColor >= 0 && selectedColor < appColorList.length);

  ThemeData getThemeData() => ThemeData(
    brightness: brightness,
    colorSchemeSeed: appColorList[selectedColor],
    appBarTheme: AppBarTheme(
      //backgroundColor: colorList[selectedColor],
      elevation: 6,
      shadowColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
}
