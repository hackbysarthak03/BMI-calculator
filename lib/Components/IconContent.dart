import 'package:flutter/material.dart';
import 'Constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key,required this.title,required this.icon});

  final String title;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: Colors.white,
          ),
          SizedBox(height: 10,),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w400),)
          
        ],
      );
  }
}
