import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:property_swap/Screens/Profile.dart';
import 'package:property_swap/firebase/Resource/Auth_Methods.dart';
import 'package:property_swap/firebase/utils/utils.dart';

import 'Login.dart';
import 'YourProperty.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  Future<String> SignUpUser() async {
    String res = '';
    setState(() {
      _isLoading = true;
    });
    res = await _authMethods.signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
    );

    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Profile(),
        ),
      );
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    var W = MediaQuery.of(context).size.width;
    var H = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: W,
                height: H * 0.25,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign Up Here',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: H * 0.02),
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
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          suffixIcon: const Icon(
                            Icons.text_fields,
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
                    SizedBox(height: H * 0.02),
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
                        controller: _emailController,
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
                    SizedBox(height: H * 0.02),
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
                        controller: _passwordController,
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
                    SizedBox(height: H * 0.02),
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
                          hintText: 'Confirm Password',
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
                    SizedBox(height: H * 0.04),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(left: 110, right: 110),
                        width: W * 0.4,
                        height: H * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue[900],
                        ),

                        //Needs Fixing

                        child: ElevatedButton(
                          onPressed: () {
                            SignUpUser;
                            showSnackBar(SignUpUser().toString(), context);
                          },
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                text: '',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: ' Sign Up',
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      recognizer: TapGestureRecognizer()),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: H * 0.04),
                    InkWell(
                      onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Login())),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Already A Member ',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                text: ' Sign In',
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                                recognizer: TapGestureRecognizer(),
                              ),
                            ],
                          ),
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
