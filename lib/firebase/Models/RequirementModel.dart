import 'package:cloud_firestore/cloud_firestore.dart';

class RequirementModel {
  final String? rId;
  final String? uid;

  final String? location;
  final String? propertyType;
  final int? minBedrooms;
  final int? maxBedrooms;
  final String? rentType;
  final int? rent;

  const RequirementModel({
    required this.rId,
    required this.location,
    required this.propertyType,
    required this.minBedrooms,
    required this.maxBedrooms,
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
      minBedrooms: snapshot["minBedrooms"],
      maxBedrooms: snapshot["maxBedrooms"],
      uid: snapshot["uid"],
      rentType: snapshot["rentType"],
      rent: snapshot["rent"],
    );
  }

  Map<String, dynamic> toJson() => {
        "rId": rId,
        "location": location,
        "propertyType": propertyType,
        "minBedrooms": minBedrooms,
        "maxBedrooms": maxBedrooms,
        "uid": uid,
        "rentType": rentType,
        "rent": rent,
      };
}
