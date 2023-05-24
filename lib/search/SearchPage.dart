import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int distance = 1;
  int minRoom = 1;
  int maxRoom = 1;
  int minRent = 1;
  int maxRent = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Distance: $distance',
              style: TextStyle(fontSize: 16.0),
            ),
            Slider(
              min: 1,
              max: 50,
              value: distance.toDouble(),
              onChanged: (double value) {
                setState(() {
                  distance = value.toInt();
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bedroom_parent_outlined),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Bed Rooms',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Min: $minRoom',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  width: 130,
                  child: Slider(
                    min: 1,
                    max: 10,
                    value: minRoom.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        minRoom = value.toInt();
                      });
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Max: $maxRoom',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  width: 130,
                  child: Slider(
                    min: 1,
                    max: 10,
                    value: maxRoom.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        maxRoom = value.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.currency_pound),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Rent/Month',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Min: $minRent',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  width: 130,
                  child: Slider(
                    min: 1,
                    max: 1000,
                    value: minRent.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        minRent = value.toInt();
                      });
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Max: $maxRent',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  width: 130,
                  child: Slider(
                    min: 1,
                    max: 1000,
                    value: maxRent.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        maxRent = value.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            SizedBox(
              height: 160,
              child: Features(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                print('Slider 1 Value: $distance');
                print('Slider 2 Value: $minRoom');
                print('Slider 3 Value: $maxRoom');
                print('Slider 4 Value: $minRent');
                print(features);
              },
            ),
          ],
        ),
      ),
    );
  }
}

List<String> features = [];

class Features extends StatefulWidget {
  Features({Key? key}) : super(key: key);

  @override
  _FeaturesState createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  final List<String> _itemsList = [
    'Double Glaz',
    'Gardon',
    'Drive Way',
    'Conservatory',
    'Balcony',
    ' Single Garage',
    ' Double Garage',
    ' Gas Central Hearing',
    'Electric Heating',
    ' Oil Heating ',
    'Private Gardon',
    ' Communal Garden',
    ' Fast Internet',
    ' Disable/Mobility Adapted'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _itemsList.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _itemsList[index];
        return CheckboxListTile(
          title: Text(item),
          value: features.contains(item),
          onChanged: (bool? isChecked) {
            setState(() {
              if (isChecked ?? false) {
                features.add(item);
              } else {
                features.remove(item);
              }
            });
          },
        );
      },
    );
  }
}
