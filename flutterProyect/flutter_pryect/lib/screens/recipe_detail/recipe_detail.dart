import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  final String recipeName;
  const RecipeDetail({super.key, required this.recipeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.center,
          recipeName,
        ),
        backgroundColor: Colors.orange,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => {
                  Navigator.pop(context) // Regresa a la pantalla anterior
                }),
      ),
    );
  }
}
