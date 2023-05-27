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
  final int beds;
  final int rent;
  final String city;

  const PropertyModel({
    required this.pId,
    required this.address,
    required this.propertyType,
    required this.qualities,
    required this.description,
    required this.uid,
    required this.landLord,
    required this.photoUrl,
    required this.beds,
    required this.rent,
    required this.city,
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
      beds: snapshot["beds"],
      rent: snapshot["rent"],
      city: snapshot["city"],
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
        "beds": beds,
        "rent": rent,
        "city": city,
      };
}
