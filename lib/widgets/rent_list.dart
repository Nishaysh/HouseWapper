import 'package:flutter/material.dart';

int rent = 0;

class RentListWidget extends StatefulWidget {
  List<int> numbers;

// NumberDropdownWidget dropdownWidget = NumberDropdownWidget(numbers: numbers);

  RentListWidget({required this.numbers});

  @override
  _RentListWidgetState createState() => _RentListWidgetState();
}

class _RentListWidgetState extends State<RentListWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: rent,
      onChanged: (int? newValue) {
        setState(() {
          rent = newValue!;
        });
      },
      items: widget.numbers.map((int number) {
        return DropdownMenuItem<int>(
          value: number,
          child: Text(number.toString()),
        );
      }).toList(),
    );
  }
}
