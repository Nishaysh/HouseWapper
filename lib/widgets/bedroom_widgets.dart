import 'package:flutter/material.dart';

int YourBedrooms = 0;

class BedNumWidgetForYourPrp extends StatefulWidget {
  List<int> numbers;

// NumberDropdownWidget dropdownWidget = NumberDropdownWidget(numbers: numbers);

  BedNumWidgetForYourPrp({required this.numbers});

  @override
  _BedNumWidgetForYourPrpState createState() => _BedNumWidgetForYourPrpState();
}

class _BedNumWidgetForYourPrpState extends State<BedNumWidgetForYourPrp> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: YourBedrooms,
      onChanged: (int? newValue) {
        setState(() {
          YourBedrooms = newValue!;
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

int reqBedrooms = 0;

class BedNumReqWidget extends StatefulWidget {
  List<int> numbers;

// NumberDropdownWidget dropdownWidget = NumberDropdownWidget(numbers: numbers);

  BedNumReqWidget({required this.numbers});

  @override
  _BedNumReqWidgetState createState() => _BedNumReqWidgetState();
}

class _BedNumReqWidgetState extends State<BedNumReqWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: reqBedrooms,
      onChanged: (int? newValue) {
        setState(() {
          reqBedrooms = newValue!;
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
