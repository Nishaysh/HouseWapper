import 'package:flutter/material.dart';


class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: const [  
            Text('First Property',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
             ),
            ),
            SizedBox(height: 10),
            
              Text('Second Property',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
             ),
            ),

            SizedBox(height: 10),

              Text('Third Property',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
             ),
            ),

            SizedBox(height: 10),

              Text('Fourth Property',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
             ),
            ),

            SizedBox(height: 10),

              Text('Fifth Property',
            style: TextStyle(
              fontSize: 20,
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