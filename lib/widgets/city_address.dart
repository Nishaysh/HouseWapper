import 'package:flutter/material.dart';

String cityForAdd = '';

class CityFormPostalcode extends StatefulWidget {
  CityFormPostalcode();

  @override
  _CityFormPostalcodeState createState() => _CityFormPostalcodeState();
}

class _CityFormPostalcodeState extends State<CityFormPostalcode> {
  final List<String> _allItemsList = [
    'London',
    'Manchester',
    'Birmingham',
    'Liverpool',
    'Glasgow',
    'Leeds',
    'Newcastle',
    'Sheffield',
    'Bristol',
    'Edinburgh',
    'Cardiff',
    'Belfast',
    'Nottingham',
    'Southampton',
    'Oxford',
    'York',
    'Cambridge',
    'Reading',
    'Aberdeen',
    'Swansea',
  ];

  List<String> _filteredItemsList = [];

  void _onItemSelect(String item) {
    setState(() {
      cityForAdd = item;
    });
  }

  void _onSearchTextChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItemsList = List.from(_allItemsList);
      } else {
        _filteredItemsList = _allItemsList
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _onSearchTextChanged,
              decoration: InputDecoration(
                labelText: 'City',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: _filteredItemsList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _filteredItemsList[index];
                  return ListTile(
                    title: Text(item),
                    onTap: () => _onItemSelect(item),
                    tileColor: cityForAdd == item ? Colors.blue : null,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Step getStep() {
    return Step(
      title: Text('Select Item'),
      content: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _onSearchTextChanged,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredItemsList.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _filteredItemsList[index];
                return ListTile(
                  title: Text(item),
                  onTap: () => _onItemSelect(item),
                  tileColor: cityForAdd == item ? Colors.blue : null,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Selected Item: $cityForAdd',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
