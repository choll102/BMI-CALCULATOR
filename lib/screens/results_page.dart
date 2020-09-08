import 'package:flutter/material.dart';
import 'package:flutter_app/components/reusable_card.dart';
import '../components/BottomButton.dart';
import '../constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.interpretation,@required this.bmiResult,@required this.resultText
  });
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('home 2') ,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your result',style: titleTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(colour: activeCardColour,
            cardChild: Column
              (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(resultText.toUpperCase(),style: resultTextStyle,),
                Text(bmiResult,style: BMITextStyle,),
                Text(interpretation,style: bodyTextStyle,textAlign: TextAlign.center,),
                BottomButton(buttonTitle: 'COME BACK',onTap: (){
                      Navigator.pop(context);
                },),
              ],
            ),),
          ),
        ],
      ),
    );
  }
}
