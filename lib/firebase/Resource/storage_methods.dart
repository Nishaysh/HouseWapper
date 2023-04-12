import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:property_swap/firebase/Models/propertyModel.dart';
import 'package:uuid/uuid.dart';

class StorageMehtods {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> storePropertyForm({
    required String pId,
    required String address,
    required String propertyType,
    required List<String> qualities,
    required String description,
    required String uid,
    required String landLord,
  }) async {
    String res = "Some error Occurred";
    String postId = const Uuid().v1();

    try {
      if (address.isNotEmpty ||
          propertyType.isNotEmpty ||
          qualities.isNotEmpty ||
          description.isNotEmpty ||
          landLord.isNotEmpty) {
        PropertyModel _prop = PropertyModel(
          pId: pId,
          address: address,
          propertyType: propertyType,
          qualities: qualities,
          description: description,
          uid: uid,
          landLord: landLord,
        );

        // adding user in our database
        await _firestore
            .collection("propertyForm")
            .doc(postId)
            .set(_prop.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}
