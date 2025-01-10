import 'package:flutter/material.dart';

class CustomImageUrlField extends StatelessWidget {
  final String label;

  const CustomImageUrlField({key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: 'Quicksand',
          color: const Color.fromARGB(255, 255, 165, 30),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.orange, width: 1),
        ),
      ),
    );
  }
}
