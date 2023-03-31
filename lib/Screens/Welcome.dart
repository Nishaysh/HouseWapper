import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
     double W = MediaQuery.of(context).size.width;
    double H = MediaQuery.of(context).size.height;
  
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: W,
              height: H*0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('img/1.webp'),
                ),
              ),
            ),
              SizedBox(height: H*0.04),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: W,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome To Property Swap',
                 style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                    ), 
                  ),
                  SizedBox(height: H*0.01),

                  const Text('Welcome to House Swap',
                 style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                    ), 
                  ),
                   
                   SizedBox(height: H*0.02),

                   Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 0.7,
                          offset: const Offset(1,1),
                         color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),

                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Name',
                        suffixIcon: const Icon(Icons.text_fields,color: Colors.red,),
                      
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:const BorderSide(
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

                  SizedBox(height: H*0.02),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 0.7,
                          offset: const Offset(1,1),
                         color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),

                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        suffixIcon: const Icon(Icons.email,color: Colors.red,),
                      
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

                SizedBox(height: H*0.02),

                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 0.7,
                          offset: const Offset(1,1),
                         color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: const Icon(Icons.password,color: Colors.red,
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

                  SizedBox(height: H*0.04),

        
                
                Center(
                  child: Container(
                    
                   margin: const EdgeInsets.only(left: 110, right: 110),                
                    width: W*0.4,
                    height: H*0.06,
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                        color: Colors.blue[900],
                       
                     ),
                     child:const Center(
                       child: Text('Sign Up',
                       style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    
                       ),),
                     ),

                  ),
                ),
                
                 SizedBox(height: H*0.04),

                Center(
                  child: RichText(text: const TextSpan(
                    text:'Already A Member ',
                         style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                          children:[
                            TextSpan(
                            text:' Sign In',
                         style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                            ),
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
      );
  }
}