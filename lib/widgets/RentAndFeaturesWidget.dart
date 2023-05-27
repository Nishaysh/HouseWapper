import 'package:flutter/material.dart';
import 'package:property_swap/widgets/rent_list.dart';

List<String> checkedItems = [];

class RentAndFeatures extends StatefulWidget {
  const RentAndFeatures({Key? key}) : super(key: key);

  @override
  _RentAndFeaturesState createState() => _RentAndFeaturesState();
}

class _RentAndFeaturesState extends State<RentAndFeatures> {
  List<int> rent = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];
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
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: ListView.builder(
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
          ),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all()),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Rent:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RentListWidget(numbers: const [
                0,
                100,
                200,
                300,
                400,
                500,
                600,
                700,
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
