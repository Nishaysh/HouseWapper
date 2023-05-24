import 'package:flutter/material.dart';

String prpType = '';

class PropertyType extends StatefulWidget {
  @override
  _PropertyTypeState createState() => _PropertyTypeState();
}

class _PropertyTypeState extends State<PropertyType> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Property Type',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          RadioListTile(
            title: Text('House'),
            value: 'House',
            groupValue: prpType,
            onChanged: (value) {
              setState(() {
                prpType = value!;
              });
            },
          ),
          RadioListTile(
            title: Text('Flate/Maisonate'),
            value: 'Flate/Maisonate',
            groupValue: prpType,
            onChanged: (value) {
              setState(() {
                prpType = value!;
              });
            },
          ),
          RadioListTile(
            title: Text('Banglow'),
            value: 'Banglow',
            groupValue: prpType,
            onChanged: (value) {
              setState(() {
                prpType = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
