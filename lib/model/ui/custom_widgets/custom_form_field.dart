import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomFormField extends StatelessWidget {
  final String hintText;
  final Validator? validator;
  final TextInputType? type;
  final TextEditingController? controller;
  final bool hideText;

  const CustomFormField({
    Key? key,
    required this.hintText,
    this.type = TextInputType.text,
    this.validator,
    this.hideText = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextFormField(
            obscureText: hideText,
            controller: controller,
            validator: validator,
            keyboardType: type,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xffB1B1B1),
                fontSize: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
