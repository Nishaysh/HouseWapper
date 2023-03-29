

//My Details (Profile and Properties),
import 'package:flutter/material.dart';


import 'YourProperty.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: const [

            Text('First Name',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
             ),
            ),
            SizedBox(height: 10),
            
              Text('Last Name',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
             ),
            ),

            SizedBox(height: 10),

              Text('Date of Birth',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
             ),
            ),

            SizedBox(height: 10),

              Text('Email',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
             ),
            ),

            SizedBox(height: 10),

              Text('Phone Number',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
             ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}