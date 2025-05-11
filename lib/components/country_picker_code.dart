import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class CountryCodePickerField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Function(String)? onCountryCodeChanged;

  const CountryCodePickerField({
    super.key,
    required this.controller,
    required this.label,
    this.onCountryCodeChanged,
  });

  @override
  State<CountryCodePickerField> createState() => _CountryCodePickerFieldState();
}

class _CountryCodePickerFieldState extends State<CountryCodePickerField> {
  String selectedPhoneCode = "+965"; // default Kuwait

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "هذا الحقل مطلوب";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUnfocus,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(color: Colors.black),
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
            color: Color.fromARGB(255, 208, 114, 151), // لون البوردر وقت الفوكس
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: true,
              onSelect: (Country country) {
                setState(() {
                  selectedPhoneCode = "+${country.phoneCode}";
                  if (widget.onCountryCodeChanged != null) {
                    widget.onCountryCodeChanged!(selectedPhoneCode);
                  }
                });
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Color(0xFFfff5e1), width: 2.0),
              ),
            ),
            child: Text(
              selectedPhoneCode,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
