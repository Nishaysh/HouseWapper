import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:property_swap/Screens/Login.dart';
import 'package:property_swap/Screens/SignUp.dart';

import 'firebase_options.dart';

// void main() {
//   runApp(
//     WidgetsFlutterBinding.ensureInitialized();
//     GetMaterialApp(
//       home: SignUp(),
//     ),
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile

  //  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaterialApp(
    home: SignUp(),
  ));
}
