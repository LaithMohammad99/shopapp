import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:hexcolor/hexcolor.dart';

ThemeData darkThem=ThemeData(
  scaffoldBackgroundColor: Colors.deepOrange,
  primarySwatch: Colors.deepOrange,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrange),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:Colors.deepOrange,
        statusBarIconBrightness: Brightness.light),
    backgroundColor: Colors.deepOrange,
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.deepOrange,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white),
  ),
);
 ThemeData lightThem=ThemeData(
   textTheme: TextTheme(
     bodyText1: TextStyle(
         fontSize: 18,
         fontWeight: FontWeight.w600,
         color: Colors.black),
   ),
   primarySwatch: Colors.deepOrange,
   floatingActionButtonTheme: FloatingActionButtonThemeData(
       backgroundColor: Colors.deepOrange),
   scaffoldBackgroundColor: Colors.white,
   appBarTheme: AppBarTheme(
     iconTheme: IconThemeData(color: Colors.orangeAccent),
     centerTitle: true,
     titleTextStyle: TextStyle(
       color: Colors.orangeAccent,
       fontSize: 20,
       fontWeight: FontWeight.bold,
     ),
     backwardsCompatibility: false,
     systemOverlayStyle: SystemUiOverlayStyle(
         statusBarColor: Colors.white,
         statusBarIconBrightness: Brightness.dark),
     backgroundColor: Colors.white,
     elevation: 0,
   ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
       type: BottomNavigationBarType.fixed,
       selectedItemColor: Colors.orangeAccent,
       elevation: 20.0),
 );