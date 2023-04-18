import 'dart:math';

class Calculate{

  Calculate({required this.height,required this.weight});
  final int height;
  final int weight;

  late final double _bmi;

  String getBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }


  String getStatus(){
    if(_bmi<18.5){
      return 'UnderWeight';
    }else if(_bmi>25){
      return 'OverWeight';
    }else{
      return 'Normal';
    }
  }


  String statement(){
    if(_bmi<18.5){
      return 'You are losing your weight ! Eat Healthy and Stay Fit !';
    }else if(_bmi>25){
      return 'Nope ! You are too heavy\nExercise Daily !';
    }else{
      return 'Chill ! You have a perfect BMI\nGood Job !';
    }
  }


}