import 'package:flutter/material.dart';
import 'package:property_swap/search/serch.dart';
import 'package:property_swap/widgets/CityListForSearch.dart';
import 'package:property_swap/widgets/prpType.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int distance = 0;
  int beds = 0;
  int rent = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Property'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text(
              //   'Distance: $distance',
              //   style: const TextStyle(fontSize: 16.0),
              // ),
              // Slider(
              //   min: 0,
              //   max: 50,
              //   divisions: 5,
              //   value: distance.toDouble(),
              //   onChanged: (double value) {
              //     setState(() {
              //       distance = value.toInt();
              //     });
              //   },
              // ),
              // const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.bedroom_parent_outlined),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Bed Rooms ${beds}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 150,
                child: Slider(
                  min: 0,
                  max: 20,
                  divisions: 20,
                  value: beds.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      beds = value.toInt();
                    });
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.currency_pound),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Rent/Month ($rent)',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Slider(
                min: 0,
                max: 5000,
                divisions: 100,
                value: rent.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    rent = value.toInt();
                  });
                },
              ),
              const SizedBox(height: 16.0),

              SizedBox(
                height: 160,
                child: PropertyType(),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Text(
                  'City',
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5.0),

              CityList(),
              ElevatedButton(
                child: const Text('Search'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchedItems(
                        city: cityForSearching,
                        beds: beds,
                        rent: rent,
                        propertyType: prpType,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
