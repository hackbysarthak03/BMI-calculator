import 'package:flutter/material.dart';

class Contain extends StatelessWidget {
  Contain({required this.colour,required this.cardChild});

  Color colour;
  Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        );

  }
}
