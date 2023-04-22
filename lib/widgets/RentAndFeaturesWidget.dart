import 'package:flutter/material.dart';

List<String> checkedItems = [];

class RentAndFeatures extends StatefulWidget {
  RentAndFeatures({Key? key}) : super(key: key);

  @override
  _RentAndFeaturesState createState() => _RentAndFeaturesState();
}

class _RentAndFeaturesState extends State<RentAndFeatures> {
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
          value: checkedItems.contains(item),
          onChanged: (bool? isChecked) {
            setState(() {
              if (isChecked ?? false) {
                checkedItems.add(item);
              } else {
                checkedItems.remove(item);
              }
            });
          },
        );
      },
    );
  }
}
