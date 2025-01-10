import 'package:flutter/material.dart';

class CustomContentField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?) validator;

  const CustomContentField({
    Key? key,
    required this.label,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      //keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      maxLines: null,
      minLines: 3,
      keyboardType: TextInputType.multiline,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: 'Quicksand',
          color: Color.fromARGB(255, 255, 165, 30),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.orange, width: 1),
        ),
      ),
      validator: validator, // Usamos el validator pasado
    );
  }
}
