import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/controller/user_controller.dart';

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
  final userController = Get.find<UserController>();
  String selectedPhoneCode = "965"; // default Kuwait

  @override
  void initState() {
    super.initState();
    selectedPhoneCode = userController.userData['phone_code'] ?? "965";
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return "هذا الحقل مطلوب";
      //   }
      //   if (!RegExp(r'^\d+$').hasMatch(value)) {
      //     return "يجب إدخال أرقام صحيحة فقط";
      //   }
      //   return null;
      // },
      autovalidateMode: AutovalidateMode.onUnfocus,
      style: TextStyle(color: Colors.white),
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
            color: Color(0xFFFFECB3), // لون البوردر وقت الفوكس
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: true,
              exclude: ['IL'],
              onSelect: (Country country) {
                setState(() {
                  selectedPhoneCode = "${country.phoneCode}";
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
              '$selectedPhoneCode+',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
