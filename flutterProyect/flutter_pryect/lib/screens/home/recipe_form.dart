import 'package:flutter/material.dart';

class ReciperFont extends StatelessWidget {
  const ReciperFont({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          //key:_formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add New Recipe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 16),
              _buidTextField(label: 'Recipe Name'),
              SizedBox(height: 16),
              _buildAutorField(label: 'Author'),
              SizedBox(height: 20),
              _builContentField(label: 'Content'),
            ],
          ),
        ));
  }

  Widget _buidTextField({required String label}) {
    return TextFormField(
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontFamily: 'Quicksand',
              color: const Color.fromARGB(200, 200, 200, 200),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: const Color.fromARGB(255, 255, 152, 0), width: 1),
            )));
  }

  Widget _buildAutorField({required String label}) {
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
            )));
  }

  Widget _builContentField({required String label}) {
    return TextFormField(
        maxLines: null, // Allows unlimited lines
        minLines: 3, // Minimum 3 lines shown
        keyboardType: TextInputType.multiline,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
            alignLabelWithHint: true, // Aligns label with input
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
            )));
  }
}
