import 'package:TicTacToe/screens/play.dart';
import 'package:TicTacToe/utils/colors.dart';
import 'package:TicTacToe/utils/constants.dart';
import 'package:TicTacToe/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

TextEditingController _player1Controller = new TextEditingController();
TextEditingController _player2Controller = new TextEditingController();

class _HomeState extends State<Home> {
  @override
  void initState() {
    _player1Controller.clear();
    _player2Controller.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(width * 0.04),
          width: width,
          height: height,
          child: Column(
            children: [
              SizedBox(height: height * 0.05),
              Text(
                "TIC TAC TOE",
                style: blueText.copyWith(fontSize: fontSize * 3),
              ),
              Column(
                children: [
                  SizedBox(height: height * 0.1),
                  Row(
                    children: [
                      Icon(
                        FeatherIcons.x,
                        color: blue,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        "Player 1",
                        style: blueText.copyWith(fontSize: fontSize * 1.4),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  TextField(
                    style: blueText2.copyWith(color: blue.withOpacity(0.7)),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.02)),
                    ),
                    controller: _player1Controller,
                  ),
                  SizedBox(height: height * 0.05),
                  Row(
                    children: [
                      Icon(
                        FeatherIcons.circle,
                        color: blue,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        "Player 2",
                        style: blueText.copyWith(fontSize: fontSize * 1.4),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  TextField(
                    style: blueText2.copyWith(color: blue.withOpacity(0.7)),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.02)),
                    ),
                    controller: _player2Controller,
                  ),
                  SizedBox(height: height * 0.1),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: width * 0.2),
                    color: blue,
                    onPressed: () => play(),
                    child: Text(
                      "PLAY",
                      style: blueText2.copyWith(color: white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void play() {
    String player1 = _player1Controller.text;
    String player2 = _player2Controller.text;
    if (player1.isEmpty) {
      Get.snackbar(
        "",
        "",
        colorText: white,
        titleText: Text(
          "Enter Player1 name",
          style: blueText.copyWith(color: white, fontSize: fontSize * 1.4),
        ),
        messageText: SizedBox.shrink(),
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: false,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      );
    } else if (player2.isEmpty) {
      Get.snackbar(
        "",
        "",
        colorText: white,
        titleText: Text(
          "Enter Player2 name",
          style: blueText.copyWith(color: white, fontSize: fontSize * 1.4),
        ),
        messageText: SizedBox.shrink(),
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: false,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      );
    } else {
      Get.off(PlayScreen(player1, player2));
    }
  }
}
