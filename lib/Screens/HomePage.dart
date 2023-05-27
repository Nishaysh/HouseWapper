import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:property_swap/Screens/MultiStepForm.dart';
import 'package:property_swap/search/SearchPage.dart';

import '../firebase/utils/utils.dart';
import 'Matches.dart';
import 'Messaging.dart';
import 'Profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String city = '';
  String propType = '';
  int bednum = 0;
  int rent = 0;
  var userData = {};
  List pages = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('requirementForm')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (userSnap.docs.isNotEmpty) {
        var documentData = userSnap.docs[0].data();

        setState(() {
          rent = documentData['rent'];
          bednum = documentData['bedrooms'];
          city = documentData['location'];
          propType = documentData['propertyType'];
          pages = [
            Profile(
              uid: FirebaseAuth.instance.currentUser!.uid,
            ),
            Container(),
            MatchesPage(
              city: city,
              beds: bednum,
              rent: 400,
              propertyType: 'Banglow',
            ),
            const SearchScreen(),
            const Messaging(),
          ];
        });
      } else {
        print('doc not found');
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  var collection = FirebaseFirestore.instance
      .collection('requirementForm')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('rent-------------->' + rent.toString());

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
