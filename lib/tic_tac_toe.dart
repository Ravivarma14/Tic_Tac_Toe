

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:tic_tac_toe/constans.dart';

class FinalGamePad extends StatefulWidget {
  const FinalGamePad({super.key});

  @override
  State<FinalGamePad> createState() => _FinalGamePadState();
}

class _FinalGamePadState extends State<FinalGamePad> {

  var gamePad=[
    ['  ','  ','  '],
    ['  ','  ','  '],
    ['  ','  ','  ']
  ];

  int xWins=0;
  int oWins=0;
  int drawn=0;

  bool isXturn=false;
  int gameSteps=0;
  String whoWonTheMatch='';

  updateGamePad(int i, int j){
    if(isXturn && gamePad[i][j]=='  '){
      gamePad[i][j]='x';
      isXturn=false;
      gameSteps++;
    }
    else if(!isXturn && gamePad[i][j]=='  '){
      gamePad[i][j]='o';
      isXturn=true;
      gameSteps++;
    }
    if(gameSteps>=5){
      whoWins();
    }
  }

  whoWins(){

    String winsOrNot=winOrDraw();

    if(winsOrNot=='x'){
      xWins++;
      whoWonTheMatch='X \n won the last match';
      gamePad=[
        ['  ','  ','  '],
        ['  ','  ','  '],
        ['  ','  ','  ']
      ];
      gameSteps=0;
    }

    else if(winsOrNot=='o'){
      oWins++;
      whoWonTheMatch='O \n won the last match';
      gamePad=[
        ['  ','  ','  '],
        ['  ','  ','  '],
        ['  ','  ','  ']
      ];
      gameSteps=0;
    }
    else if(gameSteps==9 && winsOrNot==''){
      drawn++;
      gamePad=[
        ['  ','  ','  '],
        ['  ','  ','  '],
        ['  ','  ','  ']
      ];
      gameSteps=0;
      whoWonTheMatch='Last match is a \n Draw';
    }

  }

  String winOrDraw(){
    if(gamePad[0][0]== gamePad[1][1] &&
        gamePad[1][1] == gamePad[2][2] &&
        gamePad[2][2] !='  '){
      return gamePad[0][0];
    }
    else if(gamePad[0][2]== gamePad[1][1]&&
        gamePad[1][1] == gamePad[2][0] &&
        gamePad[2][0] !='  '){
      return gamePad[2][0];
    }
    else{
      int j=0;
      for(int i=0;i<3;i++){
        if(gamePad[i][j] == gamePad[i][j+1] &&
            gamePad[i][j+1] == gamePad[i][j+2] &&
            gamePad[i][j+2]!='  '){
          return gamePad[i][j+2];
        }
        else if(gamePad[j][i]== gamePad[j+1][i] &&
            gamePad[j+1][i] == gamePad[j+2][i] &&
            gamePad[j+2][i]!='  '){
          return gamePad[j+2][i];
        }
      }
    }
    return '';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              NeumorphicText(
                'TIC TAC TOE',
                textStyle: NeumorphicTextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                style: const NeumorphicStyle(
                  color: Colors.black,
                  shadowDarkColor: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NeumorphicText(
                    'X wins: $xWins',
                    textStyle: NeumorphicTextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    style: const NeumorphicStyle(
                      color: Colors.black,
                      shadowDarkColor: Colors.grey,
                    ),
                  ),
                  NeumorphicText(
                    'O wins: $oWins',
                    textStyle: NeumorphicTextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    style: const NeumorphicStyle(
                      color: Colors.black,
                      shadowDarkColor: Colors.grey,
                    ),
                  ),
                  NeumorphicText(
                    'Drawn: $drawn',
                    textStyle: NeumorphicTextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    style: const NeumorphicStyle(
                      color: Colors.black,
                      shadowDarkColor: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: (){
                  setState(() {
                    updateGamePad(0, 0);
                  });
                },
                child: Text(
                  gamePad[0][0],
                  style: textStyle,
                ),
              ),
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: (){
                  setState(() {
                    updateGamePad(0, 1);
                  });
                },
                child: Text(
                  gamePad[0][1],
                  style: textStyle,
                ),
              ),
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: (){
                  setState(() {
                    updateGamePad(0, 2);
                  });
                },
                child: Text(
                  gamePad[0][2],
                  style: textStyle,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: (){
                  setState(() {
                    updateGamePad(1, 0);
                  });
                },
                child: Text(
                  gamePad[1][0],
                  style: textStyle,
                ),
              ),
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: (){
                  setState(() {
                    updateGamePad(1, 1);
                  });
                },
                child: Text(
                  gamePad[1][1],
                  style: textStyle,
                ),
              ),
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: (){
                  setState(() {
                    updateGamePad(1, 2);
                  });
                },
                child: Text(
                  gamePad[1][2],
                  style: textStyle,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: (){
                  setState(() {
                    updateGamePad(2, 0);
                  });
                },
                child: Text(
                  gamePad[2][0],
                  style: textStyle,
                ),
              ),
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: (){
                  setState(() {
                    updateGamePad(2, 1);
                  });
                },
                child: Text(
                  gamePad[2][1],
                  style: textStyle,
                ),
              ),
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: (){
                  setState(() {
                    updateGamePad(2, 2);
                  });
                },
                child: Text(
                  gamePad[2][2],
                  style: textStyle,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            alignment: Alignment.center,
            child: whoWonTheMatch==''
              ? const Text('')
                : NeumorphicButton(
              margin: padAndMargin,
              onPressed: (){},
              child: Text(
                whoWonTheMatch,
                textAlign: TextAlign.center,
                style: textStyle,
              ),
            )
          )
        ],
      ),
    );
  }
}
