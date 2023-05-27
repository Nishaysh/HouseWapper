import 'package:flutter/material.dart';

String rentType = 'Weekly';

class RentTypeWidget extends StatefulWidget {
  List<String> rentType;

// NumberDropdownWidget dropdownWidget = NumberDropdownWidget(numbers: numbers);

  RentTypeWidget({required this.rentType});

  @override
  _RentTypeWidgetState createState() => _RentTypeWidgetState();
}

class _RentTypeWidgetState extends State<RentTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: rentType,
      onChanged: (String? newValue) {
        setState(() {
          rentType = newValue!;
        });
      },
      items: widget.rentType.map((String rentType) {
        return DropdownMenuItem<String>(
          value: rentType,
          child: Text(rentType.toString()),
        );
      }).toList(),
    );
  }
}
