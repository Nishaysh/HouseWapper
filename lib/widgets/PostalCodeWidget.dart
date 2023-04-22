import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

String formattedAddress = '';

class AddressWidget extends StatefulWidget {
  const AddressWidget({
    Key? key,
  }) : super(key: key);

  @override
  _AddressWidgetState createState() => _AddressWidgetState();

  static _AddressWidgetState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AddressWidgetState>();
}

class _AddressWidgetState extends State<AddressWidget> {
  final _postalCodeController = TextEditingController();
  final _houseNumberController = TextEditingController();

  final _addressController = TextEditingController();

  String getFormattedAddress() {
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
        setState(() {
          formattedAddress =
              '${_houseNumberController.text}, ${placemark.thoroughfare}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.country}';
          _addressController.text = formattedAddress;
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
            // Call the getFormattedAddress method on the instance
            String address = AddressWidget.of(context)!.getFormattedAddress();
            // Do something with the formatted address
            print(address);
          },
          child: Text('Get Address'),
        ),
      ],
    );
  }
}
