import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/reusable_card.dart';
import 'package:flutter_app/screens/results_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../components/icon_content.dart';
import '../components/BottomButton.dart';
import '../components/round_icon_button.dart';
import 'package:flutter_app/calclutor_brain.dart';
enum Gender {
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 120;
  int weight = 0;
  int age = 5;

  // Color maleCardColour = inactiveCardColour;
  // Color femaleCardColour = inactiveCardColour;
  //
  // void updateColour(Gender selectedGender) {
  //   if(selectedGender == Gender.male){
  //   if (maleCardColour == inactiveCardColour) {
  //     maleCardColour = activeCardColour;
  //     femaleCardColour = inactiveCardColour;
  //   }
  //   else {
  //     maleCardColour = inactiveCardColour;
  //   }
  // }
  //   ////
  //   if(selectedGender == Gender.female){
  //     if (femaleCardColour == inactiveCardColour) {
  //       femaleCardColour = activeCardColour;
  //       maleCardColour  =inactiveCardColour;
  //     }
  //     else {
  //       femaleCardColour = inactiveCardColour;
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child:
            Text('BMI CALCULATOR',)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour: selectedGender == Gender.male ? activeCardColour : inactiveCardColour ,
                cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
              ) ,),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.female ? activeCardColour : inactiveCardColour,
                cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
              ),),
            ],
          )),
          Expanded(child: ReusableCard(
            colour: activeCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT', style: labelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(), style: numberTextStyle,),
                    Text('cm',style: labelTextStyle,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double kHeght){
                      setState(() {
                        height = kHeght.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ) ,),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT',style: labelTextStyle,),
                    Text(weight.toString(),style: numberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                        RoundIconButton(
                          onPress: (){
                            setState(() {
                             // ignore: unnecessary_statements
                             weight > 0 ? weight--:weight;
                            });
                          },
                          icon:FontAwesomeIcons.minus,),
                         SizedBox(width: 10.0,),
                         RoundIconButton(
                           onPress: (){
                             setState(() {
                               weight++;
                             });
                           },
                           icon: FontAwesomeIcons.plus,),
                       ],
                    )
                  ],
                ),
                colour: activeCardColour,) ,),
              Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',style: labelTextStyle,),
                        Text(age.toString(),style: numberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPress: (){
                                setState(() {
                                  // if(age>5){
                                  //   age--;
                                  // }
                                  // else{
                                  //    age;
                                  // }
                                  // ignore: unnecessary_statements
                                  age > 5 ? age--:age;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              onPress: (){
                               setState(() {
                                 age++;
                               });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  colour: activeCardColour,),
                ),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE YOUR BIM',onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(
              bmiResult:calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation:calc.getInterpretation() ,
            ),),);
          },),
        ],
      )
    );
  }
}




