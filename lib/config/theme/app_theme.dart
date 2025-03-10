import 'package:flutter/material.dart';

const List<Color> colorList = [
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

  AppTheme({this.selectedColor = 0})
    : assert(selectedColor >= 0 && selectedColor < colorList.length);

  ThemeData getThemeData() => ThemeData(
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: AppBarTheme(
      backgroundColor: colorList[selectedColor],
      elevation: 6,
      shadowColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
}
