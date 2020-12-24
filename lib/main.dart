import 'package:TicTacToe/screens/splashScreen.dart';
import 'package:TicTacToe/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      allowFontScaling: false,
      child: GetMaterialApp(
       theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: white
      ).copyWith(textTheme: GoogleFonts.luckiestGuyTextTheme()),
        home: SplashScreen(),
      ),
    );
  }
}
