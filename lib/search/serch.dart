import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:property_swap/PropertyCard/property_card.dart';

class SearchedItems extends StatefulWidget {
  final String city;
  final int beds;
  final int rent;
  final String propertyType;
  const SearchedItems({
    super.key,
    required this.city,
    required this.beds,
    required this.rent,
    required this.propertyType,
  });

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
                snap: snapshot.data!.docs[index].data(),
              );
            },
          );
        }),
      ),
    );
  }
}
