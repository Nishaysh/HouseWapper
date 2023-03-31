import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:property_swap/Screens/HomePage.dart';
import 'package:property_swap/Screens/Matches.dart';
import 'package:property_swap/Screens/Messaging.dart';
import 'package:property_swap/Screens/MultiStepForm.dart';
import 'package:property_swap/Screens/Profile.dart';
import 'package:property_swap/Screens/SearchPage.dart';
import 'package:property_swap/Screens/YourProperty.dart';
import 'package:property_swap/Screens/liked.dart';

const webScreenSize = 600;
List<Widget> homeScreenItems = [
  HomePage(),
  Liked(),
  MatchesPage(),
  Messaging(),
  MultiStepForm(),
  Profile(),
  SearchPage(),
  YourProperty(),
];
