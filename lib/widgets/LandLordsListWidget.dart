import 'package:flutter/material.dart';

String selectedItem = '';

class LandLordsList extends StatefulWidget {
  LandLordsList();

  @override
  _LandLordsListState createState() => _LandLordsListState();
}

class _LandLordsListState extends State<LandLordsList> {
  final List<String> _allItemsList = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Fig',
    'Grapes',
    'Kiwi',
    'Lemon',
    'Mango',
    'Orange',
    'Peach',
    'Plum',
    'Raspberry',
    'Strawberry',
    'Watermelon',
  ];

  List<String> _filteredItemsList = [];

  void _onItemSelect(String item) {
    setState(() {
      selectedItem = item;
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
                    tileColor: selectedItem == item ? Colors.blue : null,
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
                  tileColor: selectedItem == item ? Colors.blue : null,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Selected Item: $selectedItem',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
