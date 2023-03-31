

//Property search (All properties Percentage of likeness),

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}): super (key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  ElevatedButton(onPressed: (){},
                  child: const Text(' Liked ',
                         style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                          ),
                  ),
          
                const SizedBox(width: 10,),
          
                   ElevatedButton(onPressed: (){},
                  child: const Text(' Matches ',
                         style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                          ),
                   ),
                  
                   const SizedBox(width: 10,),
          
                    ElevatedButton(onPressed: (){},
                  child: const Text(' Search ',
                         style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                          ),
                    ),
          
                  ],
              ),
            ),
          ),
        
      ),
    );
  }
}
