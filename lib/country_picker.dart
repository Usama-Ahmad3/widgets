import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({Key? key}) : super(key: key);

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  String country = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(country),
          Center(
            child: TextButton(
              onPressed: () {
                showCountryPicker(
                    favorite: ['pk'],
                    countryListTheme: CountryListThemeData(
                        borderRadius: BorderRadius.circular(12),
                        textStyle: TextStyle(fontSize: 20),
                        inputDecoration: InputDecoration(hintText: 'Search')),
                    context: context,
                    onSelect: (Country value) {
                      print(value.countryCode);
                      print(value.name);
                      country = value.phoneCode.toString();
                      setState(() {});
                    });
              },
              child: Text('Tap'),
            ),
          )
        ],
      ),
    );
  }
}
