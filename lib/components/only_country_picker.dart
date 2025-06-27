import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/controller/user_controller.dart';

class CountryOnlyPickerField extends StatefulWidget {
  final String label;
  final Function(String) onCountrySelected;

  const CountryOnlyPickerField({
    super.key,
    required this.label,
    required this.onCountrySelected,
  });

  @override
  State<CountryOnlyPickerField> createState() => _CountryOnlyPickerFieldState();
}

class _CountryOnlyPickerFieldState extends State<CountryOnlyPickerField> {
  final userController = Get.find<UserController>();

  String selectedCountry = "Kuwait";
  @override
  void initState() {
    super.initState();
    selectedCountry = userController.userData['country'] ?? "Kuwait";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCountryPicker(
          context: context,
          showPhoneCode: false,
          exclude: ['IL'],
          onSelect: (Country country) {
            setState(() {
              selectedCountry = country.name;
              widget.onCountrySelected(selectedCountry);
            });
          },
        );
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFFfff5e1), // لون البوردر العادي
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(
                255,
                208,
                114,
                151,
              ), // لون البوردر وقت الفوكس
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        child: Text(
          selectedCountry,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
