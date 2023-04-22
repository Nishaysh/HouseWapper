import 'package:flutter/material.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

class CustomContainer extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String img;

  const CustomContainer({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    var W = MediaQuery.of(context).size.width;
    var H = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: W * 0.04, bottom: H * 0.02),
        width: W * 0.89,
        height: H * 0.25,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 2,
                color: Colors.grey,
                offset: Offset(-4, 4),
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                text1,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: W * 0.02),
                  // child: Container(
                  //   width: W * 0.2,
                  //   height: H * 0.08,
                  //   decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  //     BoxShadow(
                  //       blurRadius: 5,
                  //       spreadRadius: 2,
                  //       color: Colors.grey,
                  //       offset: Offset(-4, 4),
                  //     ),
                  //   ]),
                  // ),
                  child: Container(
                    width: W * 0.20,
                    height: H * 0.15,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(img),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: W * 0.08),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text2,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      text3,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

























// Liked Page

// import 'package:flutter/material.dart';
// import 'package:houseswapperdecour/HomePage.dart';
// import 'package:houseswapperdecour/SearchPage.dart';


// import 'Matches.dart';


// class Liked extends StatefulWidget {
//  const Liked({super.key});


//  @override
//  State<Liked> createState() => _LikedState();
// }


// class _LikedState extends State<Liked> {
//  @override
//  Widget build(BuildContext context) {
//  double W = MediaQuery.of(context).size.width;
//  double H = MediaQuery.of(context).size.height;
//    return SafeArea(
//      child: Container(
//        decoration: BoxDecoration(
//          gradient: LinearGradient(
//            begin: Alignment.topCenter,
//            end: Alignment.bottomCenter,
//            colors: [
//              Colors.white,
//              Colors.white,
//            ],
//          ),
//        ),
//        child: Scaffold(
//          backgroundColor: Colors.transparent,
//          body: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [           
//              Center(
//                child: Container(
//                  width: W*1,
//                  height: H*0.15,
//                  decoration: BoxDecoration(
//                    borderRadius:
//                    BorderRadius.only(
//                      bottomLeft: Radius.circular(40),
//                      bottomRight: Radius.circular(40),
//                      topLeft: Radius.circular(0),
//                      topRight: Radius.circular(0),
//                      ),
//                     gradient: LinearGradient(
//                      begin: Alignment.topLeft,
//                      end: Alignment.bottomRight,
//                      colors: [
//                        Colors.purple,
//                        Colors.indigo.withOpacity(0.9),
//                        Colors.indigo,
//                      ],
//                     ),
//                  ),
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceAround,
//                    children: [
//                      Container(
//                        width: W*0.7,
//                              height: H*0.05,
//                              decoration: BoxDecoration(
//                                border: Border.all(
//                                  style: BorderStyle.solid,
//                                  width: 3,
//                                  color: Colors.white,
//                                ),
//                                gradient: LinearGradient(
//                                  begin: Alignment.centerLeft,
//                                  end: Alignment.centerRight,
//                                  colors: [
//                                    Colors.purple,
//                                    Colors.indigo,
//                                    Colors.purple,
//                                  ],
//                                ),
//                              ),
//                        child: Center(
//                          child: Text('Liked Properties',
//                          style: TextStyle(
//                            fontSize: 35,
//                            fontWeight: FontWeight.bold,
//                            color: Colors.white,
//                          ),
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),


//              SizedBox(height: H*0.03),


//              Center(
//                child: Container(
//                  padding: EdgeInsets.all(W*0.02),
//                  width: W*0.89,
//                  height: H*0.11,
//                  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                      begin: Alignment.topLeft,
//                      end: Alignment.bottomRight,
//                      colors: [
//                        Colors.white.withOpacity(0.4),
//                        Colors.white.withOpacity(0.10),
//                      ],
//                    ),
//                    border: Border.all(
//                      width: 2,
//                      style: BorderStyle.solid,
//                      color: Colors.grey.withOpacity(0.5)
//                    ),
//                    borderRadius:
//                    BorderRadius.all(
//                      Radius.circular(30),
//                      ),
//                      boxShadow: [BoxShadow(
//                        blurRadius: 0,
//                        spreadRadius: 0,
//                        color: Color.fromARGB(255, 83, 108, 247),
//                        offset: Offset(-10,10),
//                       ),
//                      ]
//                     ),
//                     child: Column(
//                      children: [
//                        Text('My Ads ',
//                        style: TextStyle(
//                          fontSize: 30,
//                          fontWeight: FontWeight.bold,
//                          color: Color.fromARGB(255, 5, 5, 5)),
//                        ),


//                        SizedBox(height: H*0.01),


//                        Text('Property 1 ',
//                        style: TextStyle(
//                          fontSize: 30,
//                          fontWeight: FontWeight.bold,
//                          color: Color.fromARGB(255, 5, 5, 5)),
//                        ),
//                      ],
//                     ),
//                  ),
//                ),


//                Center(
//                child: Container(
//                  padding: EdgeInsets.all(W*0.02),
//                  width: W*0.5,
//                  height: H*0.15,
//                  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                      begin: Alignment.topLeft,
//                      end: Alignment.bottomRight,
//                      colors: [
//                        Colors.white.withOpacity(0.5),
//                        Colors.white.withOpacity(0.15),
//                      ],
//                    ),
//                    border: Border.all(
//                      width: 2,
//                      style: BorderStyle.solid,
//                      color: Colors.grey.withOpacity(0.5)
//                    ),
//                    borderRadius:
//                    BorderRadius.all(
//                      Radius.circular(30),
//                      ),
//                      boxShadow: [BoxShadow(
//                        blurRadius: 0,
//                        spreadRadius: 0,
//                        color: Color.fromARGB(255, 41, 142, 63),
//                        offset: Offset(-10,7),
//                       ),
//                      ]
//                     ),
//                     child: Column(
//                      children: [
//                        Text('My Ads ',
//                        style: TextStyle(
//                          fontSize: 30,
//                          fontWeight: FontWeight.bold,
//                          color: Color.fromARGB(255, 238, 233, 233)),
//                        ),


//                        SizedBox(height: H*0.01),


//                        Text('Property 1 ',
//                        style: TextStyle(
//                          fontSize: 30,
//                          fontWeight: FontWeight.bold,
//                          color: Color.fromARGB(255, 238, 233, 233)),
//                        ),
//                      ],
//                     ),
//                  ),
//                ),


//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                  children: [
//                  ElevatedButton(
//                      onPressed: (){
//                      Navigator.push(context,
//                      MaterialPageRoute(builder: (context)=> HomePage()));
//                    },
//                    child: Text('Home Page ',
//                            style: TextStyle(
//                              fontSize: 20,
//                              fontWeight: FontWeight.bold,
//                              color: Colors.black),
//                            ),
//                          ),
                        


//                  ElevatedButton(
//                      onPressed: (){
//                      Navigator.push(context,
//                      MaterialPageRoute(builder: (context)=> Machtes()));
//                    },
//                    child: Text('Matches Page ',
//                            style: TextStyle(
//                              fontSize: 20,
//                              fontWeight: FontWeight.bold,
//                              color: Colors.black),
//                            ),
//                          ),
//                         ],
//                        ),
//        ],    
//       ),
//      ),
//     ),
//    );
//  }
// }
