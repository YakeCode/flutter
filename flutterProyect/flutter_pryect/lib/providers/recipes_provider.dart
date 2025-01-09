import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pryect/models/recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipesProvider extends ChangeNotifier {
  // escucha los cambios de las llamadas

  bool isLoading = false; // Variable de carga
  List<Recipe> recipes = [];

// get del json
//Android: 10.0.2.2
//IOS 127.0.0.1
//web localhost
  Future<void> FetchRecipes() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse('http://10.0.2.2:3210/recipes');
    try {
      final response = await http.get(url); //solicitud http get
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Retorna la lista de recetas contenida en la clave 'recipes' del JSON.
        recipes = List<Recipe>.from(
            data['recipes'].map((recipe) => Recipe.fromJSON(recipe)));
      } else {
        print('Error ${response.statusCode}');
        // Retorna una lista vacía si hubo un error en la solicitud.
        recipes = [];
      }
    } catch (e) {
      print('Error in request');
      recipes = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
