import 'package:BMI/Screens/results_page.dart';
import 'package:flutter/material.dart';
import '../Components/Contain.dart';
import '../Components/IconContent.dart';
import '../Components/Constants.dart';
import 'Calculate.dart';



enum Gender {
  male,
  female,
}



class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {

Gender selectedGender = Gender.male;
int height = 170;
int weight = 50;
int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Calculator', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontFamily: 'Sans-Serif-Google'),)
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: Contain(colour: selectedGender == Gender.male ? activecardColour : inactivecardColour, cardChild:IconContent(title: 'Male',icon:Icons.male,)))), 
                Expanded(child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: Contain(colour: selectedGender == Gender.female ? activecardColour : inactivecardColour, cardChild:IconContent(title: 'Female',icon: Icons.female))))],
                ),
          ),
          Expanded(child: Contain(colour: Color.fromARGB(26, 255, 255, 255), 
          cardChild:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Height', style: kLabelStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(height.toString(), style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.w900),),
                  Text(' CM', style: kLabelStyle),
                
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10, elevation: 5),
                  trackHeight: 1,
                  thumbColor: Colors.red[400],
                  activeTrackColor: Colors.red[400],
                  
                ),
                child: Slider(
                  
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                
                  inactiveColor: Colors.grey,
                  onChanged: (double newValue){
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ),
              ),
            ],
          )
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(child:Contain(colour: Color.fromARGB(26, 255, 255, 255), 
                cardChild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Weight', style: kLabelStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(weight.toString(), style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.w900),),
                        Text(' KG', style: kLabelStyle,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                        children: [
                          FloatingActionButton(
                            elevation: 1,
                            onPressed:(){
                                  setState(() {
                                    if(weight>0)
                                    weight--;
                                    else
                                      weight = 0;
                                    
                                  }
                                  );
                            },

                            child: Icon(Icons.remove,color: Colors.white,size: 35,),
                            backgroundColor: activecardColour,
                          ),
                          FloatingActionButton(
                            elevation: 1,
                            onPressed:(){
                                setState(() {
                                  weight++;
                                });
                            } ,
                            child: Icon(Icons.add,color: Colors.white,size: 35,),
                            backgroundColor: activecardColour,
                          ),
                        ],
                    )
                  ],
                ),
                
                
                )), 
                Expanded(child: Contain(colour: Color.fromARGB(26, 255, 255, 255), 
                cardChild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Age', style: kLabelStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(age.toString(), style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.w900),),
                        Text(' Y', style: kLabelStyle),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                        children: [
                          FloatingActionButton(
                            elevation: 1,
                            onPressed:(){
                                  setState(() {
                                    if(age>0)
                                    age--;
                                    else{
                                      age = 0;
                                    }
                                  });
                            },

                            child: Icon(Icons.remove,color: Colors.white,size: 35,),
                            backgroundColor: activecardColour,
                          ),
                          FloatingActionButton(
                            elevation: 1,
                            onPressed:(){
                                setState(() {
                                  age++;
                                });
                            } ,
                            child: Icon(Icons.add,color: Colors.white,size: 35,),
                            backgroundColor: activecardColour,
                          
                          ),
                        ],
                    )
                  ],
                )
                
                ))],
                ),
          ),

          GestureDetector(
            onTap: (){
                  Calculate c = Calculate(height: height, weight: weight);


                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ResultPage(bmi: c.getBMI(),status: c.getStatus(),statement: c.statement(),);
              }));
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red[400],
          
              ),
              child: Center(child: Text('Calculate', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),)),
            ),
          )

        ],
      ),
    );
  }
}



