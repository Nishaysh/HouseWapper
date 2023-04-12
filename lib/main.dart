import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:property_swap/Screens/Login.dart';
import 'package:property_swap/Screens/Messaging.dart';
import 'package:property_swap/Screens/PostalCodeWidget.dart';
import 'package:property_swap/Screens/Profile.dart';
import 'package:property_swap/Screens/SignUp.dart';
import 'package:property_swap/Screens/YourProperty.dart';
import 'package:property_swap/firebase/Provider/user_provider.dart';
import 'package:property_swap/firebase/Resource/storage_methods.dart';
import 'package:property_swap/firebase/chat/homepage.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      );

  runApp(
    MaterialApp(
      home: SignUp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //FirebaseAuth.instance.signOut();
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData) {
                // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                return Profile(
                  uid: FirebaseAuth.instance.currentUser!.uid,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }

            // means connection to future hasnt been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const Login();
          },
        ),
      ),
    );
  }
}

// class test extends StatefulWidget {
//   const test({super.key});

//   @override
//   State<test> createState() => _testState();
// }

// class _testState extends State<test> {
//   StorageMehtods storageMehtods = StorageMehtods();
//   void store() {
//     print(address + "test");
//     storageMehtods.storePropertyForm(
//       pId: 'pId',
//       address: 'address',
//       propertyType: 'propertyType',
//       qualities: ['test', 'test2'],
//       description: 'description',
//       uid: 'uid',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: store,
//           child: Text('store'),
//         ),
//       ),
//     );
//   }
// }
