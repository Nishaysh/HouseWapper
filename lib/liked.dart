

import 'package:flutter/material.dart';


class Liked extends StatefulWidget {
  const Liked({super.key});

  @override
  State<Liked> createState() => _LikedState();
}

class _LikedState extends State<Liked> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
               
               Text('Property one',
               style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
               ),
               ),
        
               SizedBox(height: 20),
        
               Text('Property Second',
               style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
               ),
               ),
        
               SizedBox(height: 20),
        
               Text('Property third',
               style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
               ),
               ),
               
               
                
              ],
            ),
          ),
        ),
       ),
      );
  }
}