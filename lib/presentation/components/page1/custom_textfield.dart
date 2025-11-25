import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.labelText,
    this.formatter,
    required this.textInput,
  });

  final TextEditingController? controller;
  final String labelText;
  final List<TextInputFormatter>? formatter;
  final TextInputType textInput;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInput,
      inputFormatters: formatter,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: Icon(Icons.add_box),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: Colors.deepOrange, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: Colors.deepOrange),
        ),
      ),
    );
  }
}
