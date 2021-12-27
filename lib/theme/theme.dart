import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  hoverColor: Colors.grey[200],
  highlightColor: Colors.transparent,
  focusColor: Colors.transparent,
  splashColor: Colors.green[100],
  //Text Selection Theme
  textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.green[500]),
  //Text Theme
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.green[500],
      fontSize: 25.0,
      fontFamily: "Black",
    ),
    headline2: TextStyle(
      color: Colors.green[500],
      fontSize: 22.0,
      fontFamily: "Bold",
    ),
    headline3: TextStyle(
      color: Colors.green[500],
      fontSize: 16.0,
      letterSpacing: 1,
      fontFamily: "Medium",
    ),
    headline4: TextStyle(
      color: Colors.green[500],
      fontSize: 14,
      fontFamily: "Regular",
    ),
    headline5: TextStyle(
      color: Colors.green[500],
      fontSize: 18,
      fontFamily: "Light",
    ),
    headline6: TextStyle(
      color: Colors.green[500],
      fontSize: 14,
      fontFamily: "Light",
    ),
    subtitle1: TextStyle(
      color: Colors.grey[700],
      fontSize: 15,
      fontFamily: "Bold",
    ),
    subtitle2: TextStyle(
      color: Colors.grey[700],
      fontSize: 14,
      fontFamily: "Regular",
    ),
    button: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontFamily: "Regular",
    ),
    caption: TextStyle(
      color: Colors.grey[700],
      fontSize: 14,
      fontFamily: "Light",
    ),
  ),

  //Input Theme
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
        color: Colors.grey[700],
        fontSize: 14,
        fontFamily: "Regular",
        decoration: TextDecoration.none),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
            color: Colors.green[500]!, width: 1, style: BorderStyle.solid)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
            color: Colors.green[500]!, width: 1, style: BorderStyle.solid)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
            color: Colors.green[500]!, width: 1, style: BorderStyle.solid)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
            color: Colors.green[500]!, width: 1, style: BorderStyle.solid)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
            color: Colors.green[500]!, width: 1, style: BorderStyle.solid)),
    contentPadding: EdgeInsets.all(10),
    errorStyle: TextStyle(
      backgroundColor: Colors.white,
      color: Colors.red[500]!,
      fontSize: 13,
      fontFamily: 'Light',
    ),
  ),

  //Primary Button Theme
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
        overlayColor:
            MaterialStateProperty.resolveWith((states) => Colors.white),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 14,
            fontFamily: 'Regular',
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => BorderSide(
              color: Colors.green[500]!, width: 1, style: BorderStyle.solid),
        ),
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.green[500]!),
        splashFactory: NoSplash.splashFactory),
  ),
  //Secondary Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith((states) => 0),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 14,
            fontFamily: 'Regular',
            fontWeight: FontWeight.normal,
            color: Colors.grey[700],
          ),
        ),
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.green[500]!),
        splashFactory: NoSplash.splashFactory),
  ),

  //Thirtiary Button Theme
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith((states) => 0),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 14,
            fontFamily: 'Regular',
            fontWeight: FontWeight.normal,
            color: Colors.grey[700],
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        )),
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.green[500]!),
        splashFactory: NoSplash.splashFactory),
  ),
  //Checkbox Theme
  checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => Colors.green[500]!),
      side: BorderSide(
          color: Colors.green[500]!, width: 1, style: BorderStyle.solid)),
);
