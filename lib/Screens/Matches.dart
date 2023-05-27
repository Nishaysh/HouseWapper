import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:property_swap/PropertyCard/property_card.dart';

class MatchesPage extends StatefulWidget {
  final String city;
  final int beds;
  final int rent;
  final String propertyType;
  const MatchesPage({
    super.key,
    required this.city,
    required this.beds,
    required this.rent,
    required this.propertyType,
  });

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  final TextEditingController _searchController = TextEditingController();
  bool isShowUsers = true;
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  Stream<QuerySnapshot> getFilteredResults() {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('propertyForm');

    var query = collection
        .where('city', isEqualTo: widget.city)
        .where('beds', isEqualTo: widget.beds)
        .where(
          'rent',
          isEqualTo: widget.rent,
        )
        .where(
          'propertyType',
          isEqualTo: widget.propertyType,
        )
        .snapshots();

    return query;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('See Properties'),
      ),
      body: StreamBuilder(
        stream: getFilteredResults(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return PropertyCard(
                snap: snapshot.data!.docs[index].data(),
              );
            },
          );
        }),
      ),
    );
  }
}

// class MatchesPage extends StatelessWidget {
//   const MatchesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: StreamBuilder(
//           stream:
//               FirebaseFirestore.instance.collection('propertyForm').snapshots(),
//           builder: (context,
//               AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//             if (ConnectionState == ConnectionState.waiting ||
//                 snapshot.data == null) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             return ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, index) => PropertyCard(
//                 snap: snapshot.data!.docs[index].data(),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
