import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:property_swap/firebase/Resource/storage_methods.dart';
import 'package:uuid/uuid.dart';
import '../Models/propertyModel.dart';

class PropertyFormMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> storePropertyForm({
    required String pId,
    required String address,
    required String propertyType,
    required List<String> qualities,
    required String description,
    required String uid,
    required String landLord,
    required Uint8List file,
  }) async {
    String res = "Some error Occurred";
    String postId = const Uuid().v1();

    try {
      if (address.isNotEmpty ||
          propertyType.isNotEmpty ||
          qualities.isNotEmpty ||
          description.isNotEmpty ||
          landLord.isNotEmpty) {
        String photoUrl = await StorageMehtods()
            .uploadImagetoStorage('profilePics', file, false);
        PropertyModel _prop = PropertyModel(
          pId: pId,
          address: address,
          propertyType: propertyType,
          qualities: qualities,
          description: description,
          uid: uid,
          landLord: landLord,
          photoUrl: photoUrl,
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
