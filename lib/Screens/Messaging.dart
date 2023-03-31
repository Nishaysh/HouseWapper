//Massages to and from,
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Login.dart';

class Messaging extends StatefulWidget {
  const Messaging({super.key});

  @override
  State<Messaging> createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.centerRight,
          width: 700,
          height: 600,
          child: Center(
            child: RichText(
              text: TextSpan(
                text: 'Back To  ',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: [
                  TextSpan(
                      text: ' LogIn Page',
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => Login())),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
