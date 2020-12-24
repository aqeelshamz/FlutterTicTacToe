import 'package:TicTacToe/screens/home.dart';
import 'package:TicTacToe/utils/constants.dart';
import 'package:TicTacToe/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), (){
      Get.off(Home());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TIC TAC TOE",
                style: blueText.copyWith(fontSize: fontSize * 5),
              ),
              Text(
                "@aqeelshamz",
                style: blueText.copyWith(fontSize: fontSize * 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
