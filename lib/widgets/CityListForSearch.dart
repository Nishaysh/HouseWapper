import 'package:flutter/material.dart';

String cityForSearching = '';

class CityList extends StatefulWidget {
  CityList();

  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
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
      cityForSearching = item;
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
      height: 150,
      child: Column(
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
            child: Container(
              child: ListView.builder(
                itemCount: _filteredItemsList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _filteredItemsList[index];
                  return ListTile(
                    title: Text(item),
                    onTap: () => _onItemSelect(item),
                    tileColor: cityForSearching == item ? Colors.blue : null,
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
                  tileColor: cityForSearching == item ? Colors.blue : null,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Selected Item: $cityForSearching',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
