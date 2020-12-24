import 'package:TicTacToe/screens/home.dart';
import 'package:TicTacToe/utils/colors.dart';
import 'package:TicTacToe/utils/constants.dart';
import 'package:TicTacToe/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

int _win = 2;
int _turns = 9;
int _currentTurn = 0;
Map<int, List<int>> _mark = {
  0: [null, null, null],
  1: [null, null, null],
  2: [null, null, null]
};

class PlayScreen extends StatefulWidget {
  final String player1;
  final String player2;

  PlayScreen(this.player1, this.player2);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  void initState() {
    setState(() {
      _turns = 9;
      _win = 2;
      _currentTurn = 0;
      _mark = {
        0: [null, null, null],
        1: [null, null, null],
        2: [null, null, null]
      };
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "TIC TAC TOE",
                    style: blueText2.copyWith(fontSize: fontSize * 4),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "CURRENT TURN:  ",
                        style: blueText2.copyWith(color: Colors.blueGrey),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _currentTurn == 0 ? widget.player1 : widget.player2,
                            style: blueText2,
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          _currentTurn == 0
                              ? Icon(
                                  FeatherIcons.x,
                                  color: blue,
                                  size: width * 0.05,
                                )
                              : Icon(
                                  FeatherIcons.circle,
                                  color: blue,
                                  size: width * 0.05,
                                ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              _win != 2
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _win == 0
                                ? Icon(FeatherIcons.x)
                                : Icon(FeatherIcons.circle),
                            SizedBox(width: width * 0.02),
                            Text(
                              "${_win == 0 ? widget.player1.toString() : widget.player2.toString()} Win! 🎉",
                              style: blueText2.copyWith(
                                color: Colors.black,
                                fontSize: fontSize * 2.5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.02, horizontal: width * 0.1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          color: blue,
                          onPressed: () {
                            setState(() {
                              _turns = 9;
                              _win = 2;
                              _currentTurn = 0;
                              _mark = {
                                0: [null, null, null],
                                1: [null, null, null],
                                2: [null, null, null]
                              };
                            });
                          },
                          child: Text(
                            "RESTART",
                            style: blueText2.copyWith(color: white),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.02, horizontal: width * 0.1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          color: blue,
                          onPressed: () {
                            Get.off(Home());
                          },
                          child: Text(
                            "NEW GAME",
                            style: blueText2.copyWith(color: white),
                          ),
                        ),
                      ],
                    )
                  : _turns == 0
                      ? Column(
                          children: [
                            Text(
                              "❌ DRAW ❌",
                              style: blueText2.copyWith(
                                color: Colors.black,
                                fontSize: fontSize * 2.5,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: height * 0.02,
                                  horizontal: width * 0.1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              color: blue,
                              onPressed: () {
                                setState(() {
                                  _turns = 9;
                                  _win = 2;
                                  _currentTurn = 0;
                                  _mark = {
                                    0: [null, null, null],
                                    1: [null, null, null],
                                    2: [null, null, null]
                                  };
                                });
                              },
                              child: Text(
                                "RETRY",
                                style: blueText2.copyWith(color: white),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            buildRow(0),
                            buildRow(1),
                            buildRow(2),
                          ],
                        ),
              SizedBox.shrink(),
              SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(int n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(width * 0.01),
          child: GestureDetector(
            onTap: () {
              if (_mark[n][0] == null) {
                _mark[n][0] = _currentTurn == 0 ? 0 : 1;

                if (_currentTurn == 0) {
                  _currentTurn = 1;
                } else {
                  _currentTurn = 0;
                }
              }

              setState(() {});
              checkWin();
            },
            child: Container(
              width: width * 0.2,
              height: width * 0.2,
              color: blue,
              child: _mark[n][0] == null
                  ? SizedBox.shrink()
                  : _mark[n][0] == 0
                      ? Icon(
                          FeatherIcons.x,
                          color: white,
                        )
                      : Icon(
                          FeatherIcons.circle,
                          color: white,
                        ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.01),
          child: GestureDetector(
            onTap: () {
              if (_mark[n][1] == null) {
                _mark[n][1] = _currentTurn == 0 ? 0 : 1;

                if (_currentTurn == 0) {
                  _currentTurn = 1;
                } else {
                  _currentTurn = 0;
                }
              }

              setState(() {});
              checkWin();
            },
            child: Container(
              width: width * 0.2,
              height: width * 0.2,
              color: blue,
              child: _mark[n][1] == null
                  ? SizedBox.shrink()
                  : _mark[n][1] == 0
                      ? Icon(
                          FeatherIcons.x,
                          color: white,
                        )
                      : Icon(
                          FeatherIcons.circle,
                          color: white,
                        ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.01),
          child: GestureDetector(
            onTap: () {
              if (_mark[n][2] == null) {
                _mark[n][2] = _currentTurn == 0 ? 0 : 1;

                if (_currentTurn == 0) {
                  _currentTurn = 1;
                } else {
                  _currentTurn = 0;
                }
              }

              setState(() {});
              checkWin();
            },
            child: Container(
              width: width * 0.2,
              height: width * 0.2,
              color: blue,
              child: _mark[n][2] == null
                  ? SizedBox.shrink()
                  : _mark[n][2] == 0
                      ? Icon(
                          FeatherIcons.x,
                          color: white,
                        )
                      : Icon(
                          FeatherIcons.circle,
                          color: white,
                        ),
            ),
          ),
        ),
      ],
    );
  }

  checkWin() {
    _turns--;
    if (_mark[0][0] != null &&
        _mark[0][0] == _mark[0][1] &&
        _mark[0][1] == _mark[0][2]) {
      if (_mark[0][0] == 0) {
        _win = 0;
      } else {
        _win = 1;
      }
    } else if (_mark[1][0] != null &&
        _mark[1][0] == _mark[1][1] &&
        _mark[1][1] == _mark[1][2]) {
      if (_mark[1][0] == 0) {
        _win = 0;
      } else {
        _win = 1;
      }
    } else if (_mark[2][0] != null &&
        _mark[2][0] == _mark[2][1] &&
        _mark[2][1] == _mark[2][2]) {
      if (_mark[2][0] == 0) {
        _win = 0;
      } else {
        _win = 1;
      }
    } else if (_mark[0][0] != null &&
        _mark[0][0] == _mark[1][1] &&
        _mark[1][1] == _mark[2][2]) {
      if (_mark[0][0] == 0) {
        _win = 0;
      } else {
        _win = 1;
      }
    } else if (_mark[0][2] != null &&
        _mark[0][2] == _mark[1][1] &&
        _mark[1][1] == _mark[2][0]) {
      if (_mark[0][2] == 0) {
        _win = 0;
      } else {
        _win = 1;
      }
    } else if (_mark[0][0] != null &&
        _mark[0][0] == _mark[1][0] &&
        _mark[1][0] == _mark[2][0]) {
      if (_mark[0][0] == 0) {
        _win = 0;
      } else {
        _win = 1;
      }
    } else if (_mark[0][1] != null &&
        _mark[0][1] == _mark[1][1] &&
        _mark[1][1] == _mark[2][1]) {
      if (_mark[0][1] == 0) {
        _win = 0;
      } else {
        _win = 1;
      }
    } else if (_mark[0][2] != null &&
        _mark[0][2] == _mark[1][2] &&
        _mark[1][2] == _mark[2][2]) {
      if (_mark[0][2] == 0) {
        _win = 0;
      } else {
        _win = 1;
      }
    }

    setState(() {});
  }
}
