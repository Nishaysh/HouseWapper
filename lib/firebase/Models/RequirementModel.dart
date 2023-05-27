import 'package:cloud_firestore/cloud_firestore.dart';

class RequirementModel {
  final String? rId;
  final String? uid;

  final String? location;
  final String? propertyType;
  final int? bedrooms;
  final String? rentType;
  final int? rent;

  const RequirementModel({
    required this.rId,
    required this.location,
    required this.propertyType,
    required this.bedrooms,
    required this.uid,
    required this.rentType,
    required this.rent,
  });

  static RequirementModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return RequirementModel(
      rId: snapshot["rId"],
      location: snapshot["location"],
      propertyType: snapshot["propertyType"],
      bedrooms: snapshot["bedrooms"],
      uid: snapshot["uid"],
      rentType: snapshot["rentType"],
      rent: snapshot["rent"],
    );
  }

  Map<String, dynamic> toJson() => {
        "rId": rId,
        "location": location,
        "propertyType": propertyType,
        "bedrooms": bedrooms,
        "uid": uid,
        "rentType": rentType,
        "rent": rent,
      };
}
