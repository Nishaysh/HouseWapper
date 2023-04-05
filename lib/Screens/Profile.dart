//My Details (Profile and Properties),
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:property_swap/firebase/Resource/Auth_Methods.dart';
import 'package:property_swap/firebase/utils/utils.dart';

import 'YourProperty.dart';

class Profile extends StatefulWidget {
  final String uid;
  const Profile({super.key, required this.uid});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthMethods _auth = AuthMethods();
  String email = '';
  String username = '';

  void signOut() {
    _auth.signOut();
    setState(() {});
  }

  var userData = {};
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();
      print(userSnap);

      userData = userSnap.data()!;
      email = userData['email'];
      username = userData['username'];

      setState(() {});
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                //change:
                username,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Text(
              //   'Last Name',
              //   style: TextStyle(
              //     fontSize: 30,
              //     color: Colors.black,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // SizedBox(height: 10),
              // Text(
              //   'Date of Birth',
              //   style: TextStyle(
              //     fontSize: 30,
              //     color: Colors.black,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // SizedBox(height: 10),
              Text(
                //change:
                email,

                // userData['email'],
                //this
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Text(
              //   'Phone Number',
              //   style: TextStyle(
              //     fontSize: 30,
              //     color: Colors.black,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              TextButton(onPressed: signOut, child: Text('signout'))
            ],
          ),
        ),
      ),
    );
  }
}
