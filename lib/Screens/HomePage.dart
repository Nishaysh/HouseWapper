import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Matches.dart';
import 'Messaging.dart';
import 'Profile.dart';
import 'Liked.dart';
import 'SearchPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    Profile(
      uid: FirebaseAuth.instance.currentUser!.uid,
    ),
    const Liked(),
    const MatchesPage(),
    const SearchPage(),
    const Messaging(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 50,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.orange,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.red.withAlpha(250),
        unselectedItemColor: Colors.black.withOpacity(0.7),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'Liked',
            icon: Icon(Icons.house),
          ),
          BottomNavigationBarItem(
            label: 'Matches',
            icon: Icon(Icons.copy),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Massages',
            icon: Icon(Icons.mail),
          ),
        ],
      ),
    );
  }
}
