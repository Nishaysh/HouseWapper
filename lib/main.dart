import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:property_swap/HomePage.dart';
import 'package:property_swap/Matches.dart';
import 'package:property_swap/Messaging.dart';
import 'package:property_swap/MultiStepForm.dart';
import 'package:property_swap/YourProperty.dart';
import 'package:property_swap/liked.dart';
import 'Login.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: Login(),
    ),
  );
}




// import 'package:flutter/material.dart';

// import 'Login.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My Portfolio',
//       home: Login(),
//     );
//   }
// }
