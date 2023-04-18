import 'package:BMI/Components/Constants.dart';
import 'package:BMI/Components/Contain.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
    ResultPage({required this.bmi, required this.status, required this.statement});

          // declaration of variables

    final String bmi;
    final String status;
    final String statement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Calculator', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontFamily: 'Sans-Serif-Google'),)
      ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 200,
                margin: EdgeInsets.all(10),
                child: Text(' Calculated Value ', style: TextStyle(
                  color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400,                        
                  fontFamily: 'Sans-Serif-Google',

                ),),
              
              ),
              Expanded(
                child: Contain(
                
                colour: inactivecardColour, 
                cardChild: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                        Text(status, style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: getColor(),
                        fontFamily: 'Sans-Serif-Google'
                      ),),
                      Text(bmi,style:const TextStyle(
                        fontSize: 70,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Sans-Serif-Google'
                      ),),
                      const Text('Normal BMI : 18.5 - 24.9', style: TextStyle(color: Colors.white, fontFamily: 'Sans-Serif-Google', fontSize: 12),),
                      Text(statement, style:const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Sans-Serif-Google',
                        fontWeight: FontWeight.w100
                        
                      ), textAlign: TextAlign.center,)
                  ],
                  ),
                )
                ),
              ),
              Container(
                height: 200,
                
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    height: 60,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 22, 100, 164),
                                
                                    ),
                                    child: Center(child: Text('Re-Calculate', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white, fontFamily: 'Sans-Serif-Google'),)),
                                  ),
                      ),
                    ],
                  ),
              
                ),

            ],
          ),
    );
  }
  
  Color getColor() {

    if(status == 'Normal')
    return Colors.green;
    else if(status == 'UnderWeight')
    return Color.fromARGB(255, 176, 159, 7);
    else 
    return Color.fromARGB(255, 248, 93, 81);


  }
}