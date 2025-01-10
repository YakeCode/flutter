import 'package:flutter/material.dart';
import 'package:flutter_pryect/forms/inputs/input_customContentField.dart';
import 'package:flutter_pryect/forms/inputs/input_customImageUrlField.dart';
import 'package:flutter_pryect/forms/inputs/input_customTextField.dart';

class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
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
            CustomTextField(label: 'Recipe Name'),
            SizedBox(height: 16),
            CustomTextField(label: 'Author'),
            SizedBox(height: 20),
            CustomImageUrlField(label: 'Image Url'),
            SizedBox(height: 20),
            CustomContentField(label: 'Content')
          ],
        ),
      ),
    );
  }
}
