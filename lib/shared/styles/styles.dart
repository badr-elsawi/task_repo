import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xffE7C8C0),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffE7C8C0),
    elevation: 0,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(
      color: Color(0xff190018),
    ),
    actionsIconTheme: IconThemeData(
      size: 30,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xffE7C8C0),
      systemNavigationBarColor: Color(0xffFEE3D8),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  cardColor: const Color(0xffAD879B),
  dividerColor: const Color(0xff735A67),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xffFEE3D8),
    elevation: 0,
    selectedItemColor: Color(0xff190018),
    unselectedItemColor: Color(0xff735A67),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xffAD879B),
    foregroundColor: Color(0xff190018),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 18,
      overflow: TextOverflow.ellipsis,
    ),
    bodySmall: TextStyle(
      color: Color(0xff735A67),
      fontSize: 15,
      overflow: TextOverflow.ellipsis,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xff061019),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xff061019),
    elevation: 0,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(
      color: Colors.grey[400],
    ),
    actionsIconTheme: const IconThemeData(
      size: 30,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Color(0xff061019),
      systemNavigationBarColor: Color(0xff121E2C),
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  cardColor: const Color(0xffE55C30),
  dividerColor: const Color(0xffFCFCFC),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: const Color(0xff121E2C),
    elevation: 0,
    selectedItemColor: const Color(0xffFCFCFC),
    unselectedItemColor: Colors.grey[400],
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xffE55C30),
    foregroundColor: Color(0xffFCFCFC),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.grey[400],
      fontSize: 18,
      overflow: TextOverflow.ellipsis,
    ),
    bodyMedium: TextStyle(
      color: Colors.grey[400],
      fontSize: 16,
      overflow: TextOverflow.ellipsis,
    ),
    bodySmall: TextStyle(
      color: Colors.grey[700],
      fontSize: 14,
      overflow: TextOverflow.ellipsis,
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Color(0xff061019),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.grey[700],
      padding: EdgeInsets.zero,
      iconSize: 25.w,
    ),
  )
);
