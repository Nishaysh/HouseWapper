import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:property_swap/PropertyCard/property_card.dart';

class SearchedItems extends StatefulWidget {
  const SearchedItems({super.key});

  @override
  State<SearchedItems> createState() => _SearchedItemsState();
}

class _SearchedItemsState extends State<SearchedItems> {
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
        .where('distance', isEqualTo: 10)
        .where('beds', isEqualTo: 2)
        .where(
          'rent',
          isEqualTo: 100,
        )
        .where(
      'qualities',
      arrayContainsAny: ['Balcony', 'hello'],
    ).snapshots();

    return query;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextFormField(
          controller: _searchController,
          decoration: const InputDecoration(
            labelText: 'Search for a user ...',
          ),
          onFieldSubmitted: (String _) {
            setState(
              () {
                isShowUsers = true;
              },
            );
          },
        ),
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
                // (snapshot.data! as dynamic).docs[index]['uid'],
                snap: snapshot.data!.docs[index].data(),
              );
            },
          );
        }),
      ),
    );
  }
}
