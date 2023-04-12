import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

String address = '';

class AddressWidget extends StatefulWidget {
  const AddressWidget({
    super.key,
  });

  @override
  _AddressWidgetState createState() => _AddressWidgetState();

  static _AddressWidgetState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AddressWidgetState>();
}

class _AddressWidgetState extends State<AddressWidget> {
  final _postalCodeController = TextEditingController();
  final _houseNumberController = TextEditingController();

  final _addressController = TextEditingController();

  String getAddress() {
    return _addressController.text;
  }

  Future<void> _getAddressFromPostalCode(String postalCode) async {
    try {
      List<Location> locations = await locationFromAddress(postalCode);
      if (locations.isNotEmpty) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          locations.first.latitude,
          locations.first.longitude,
        );
        Placemark placemark = placemarks.first;
        address = _houseNumberController.text +
            ', ' +
            placemark.subLocality.toString() +
            ', ' +
            placemark.locality.toString() +
            ', ' +
            placemark.postalCode.toString() +
            ', ' +
            placemark.country.toString();
        setState(() {
          _addressController.text = address;
        });
      } else {
        setState(() {
          _addressController.text = 'No address found for $postalCode';
        });
      }
    } catch (e) {
      setState(() {
        _addressController.text = 'Error: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _postalCodeController,
          decoration: InputDecoration(
            labelText: 'Postal Code',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        TextFormField(
          controller: _houseNumberController,
          decoration: InputDecoration(
            labelText: 'House number',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            _getAddressFromPostalCode(_postalCodeController.text);
          },
          child: Text('Get Address'),
        ),
        SizedBox(height: 16),
        Text(_addressController.text),
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddressWidget(),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Create an instance of AddressWidget
            AddressWidget addressWidget = AddressWidget();
            // Call the getAddress method on the instance
            String address = AddressWidget.of(context)!.getAddress();
            // Do something with the address
            print(address);
          },
          child: Text('Get Address'),
        ),
      ],
    );
  }
}
