import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class AddressWidget extends StatefulWidget {
  @override
  _AddressWidgetState createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  final _postalCodeController = TextEditingController();
  final _addressController = TextEditingController();
  late String _address;

  Future<void> _getAddressFromPostalCode(String postalCode) async {
    try {
      List<Location> locations = await locationFromAddress(postalCode);
      if (locations.isNotEmpty) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          locations.first.latitude,
          locations.first.longitude,
        );
        Placemark placemark = placemarks.first;
        _address = placemark.street.toString() +
            ', ' +
            placemark.subLocality.toString() +
            ', ' +
            placemark.locality.toString() +
            ', ' +
            placemark.postalCode.toString() +
            ', ' +
            placemark.country.toString();
        setState(() {
          _addressController.text = _address;
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
