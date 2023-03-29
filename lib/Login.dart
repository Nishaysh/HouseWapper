import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'SignUp.dart';

import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;
    double H = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: W,
                height: H * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/3.jpeg'),
                  ),
                ),
              ),
              SizedBox(height: H * 0.02),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: W,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'House Swap',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: H * 0.02),
                    const Text(
                      'Welcome to House Swap',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: H * 0.015),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 0.7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          suffixIcon: const Icon(
                            Icons.email,
                            color: Colors.red,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: H * 0.015),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 0.7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: const Icon(
                            Icons.password,
                            color: Colors.red,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: H * 0.015),
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        const Text(
                          'Forgot Your Password',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: H * 0.03),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(left: 110, right: 110),
                        width: W * 0.4,
                        height: H * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue[900],
                          boxShadow: const [],
                        ),
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: H * 0.05),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Not A Member ',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: [
                            TextSpan(
                                text: ' Register',
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(() => SignUp())),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
