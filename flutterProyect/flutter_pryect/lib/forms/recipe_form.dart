import 'package:flutter/material.dart';
import 'package:flutter_pryect/forms/inputs/input_customDescriptionField.dart';
import 'package:flutter_pryect/forms/inputs/input_customImageUrlField.dart';
import 'package:flutter_pryect/forms/inputs/input_customTextField.dart';

class RecipeForm extends StatefulWidget {
  const RecipeForm({super.key});

  @override
  State<RecipeForm> createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _recipeName = TextEditingController();
  final TextEditingController _recipeAuthor = TextEditingController();
  final TextEditingController _recipeImage = TextEditingController();
  final TextEditingController _recipeDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.0,
        right: 4.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque, // Captura taps fuera del teclado
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: const Text(
                    'Add New Recipe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _recipeName,
                  label: 'Recipe Name',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      // Se verifica si el texto ingresado está vacío o solo contiene espacios
                      return 'Please enter the recipe name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _recipeAuthor,
                  label: 'Author',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter the author\'s name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomImageUrlField(
                  controller: _recipeImage,
                  label: 'Image URL',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a valid image URL';
                    }
                    if (!Uri.parse(value).isAbsolute) {
                      return 'Please enter a valid URL';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomContentField(
                  controller: _recipeDescription,
                  label: 'Recipe Description',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter the recipe description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Save Recipe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
