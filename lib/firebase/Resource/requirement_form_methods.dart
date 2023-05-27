import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_swap/firebase/Models/RequirementModel.dart';
import 'package:property_swap/firebase/Resource/storage_methods.dart';
import 'package:uuid/uuid.dart';
import '../Models/propertyModel.dart';

class RequirementFormMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> storeRequirementForm({
    required String rId,
    required String uid,
    required String location,
    required String propertyType,
    required int bedrooms,
    required String rentType,
    required int rent,
  }) async {
    String res = "Some error Occurred";
    String postId = const Uuid().v1();

    try {
      if (location.isNotEmpty || propertyType.isNotEmpty) {
        RequirementModel _req = RequirementModel(
            rId: rId,
            location: location,
            propertyType: propertyType,
            bedrooms: bedrooms,
            uid: uid,
            rentType: rentType,
            rent: rent);

        // adding user in our database
        await _firestore
            .collection("requirementForm")
            .doc(postId)
            .set(_req.toJson());

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
