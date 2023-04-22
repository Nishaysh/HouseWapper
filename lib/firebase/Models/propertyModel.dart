import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyModel {
  final String? pId;
  final String? address;
  final String? propertyType;
  final List<String>? qualities;
  final String? description;
  final String? uid;
  final String? landLord;
  final String? photoUrl;

  const PropertyModel({
    required this.pId,
    required this.address,
    required this.propertyType,
    required this.qualities,
    required this.description,
    required this.uid,
    required this.landLord,
    required this.photoUrl,
  });

  static PropertyModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return PropertyModel(
      pId: snapshot["pId"],
      address: snapshot["address"],
      propertyType: snapshot["propertyType"],
      qualities: List<String>.from(snapshot["qualities"]),
      description: snapshot["description"],
      uid: snapshot["uid"],
      landLord: snapshot["landlord"],
      photoUrl: snapshot["photoUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
        "pId": pId,
        "address": address,
        "propertyType": propertyType,
        "qualities": qualities,
        "description": description,
        "uid": uid,
        "landlord": landLord,
        "photoUrl": photoUrl,
      };
}
