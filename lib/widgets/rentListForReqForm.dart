import 'package:flutter/material.dart';

int rentForReqForm = 0;

class RentListReqFromWidget extends StatefulWidget {
  List<int> numbers;

// NumberDropdownWidget dropdownWidget = NumberDropdownWidget(numbers: numbers);

  RentListReqFromWidget({required this.numbers});

  @override
  _RentListReqFromWidgetState createState() => _RentListReqFromWidgetState();
}

class _RentListReqFromWidgetState extends State<RentListReqFromWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: rentForReqForm,
      onChanged: (int? newValue) {
        setState(() {
          rentForReqForm = newValue!;
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
