import 'package:flutter/material.dart';
import 'package:flutter_pryect/providers/recipes_provider.dart';
import 'package:flutter_pryect/screens/favorites/recipes_favorites.dart';
import 'package:provider/provider.dart';

import 'screens/home/home_screen.dart';

void main() {
  //da inicio a la aplicación
  runApp(const MyApp()); // Primera llamada de vista de la aplicación
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => RecipesProvider())],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: const RecipeBook(),
        ));
  }
}

class RecipeBook extends StatelessWidget {
  const RecipeBook({super.key});

  @override // constructor de la vista
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Número de pestañas
      child: Scaffold(
        //hoja en blanco: scaffold
        appBar: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: const Text(
            'Recipe Book',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'roboto',
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorites',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [HomeScreen(), FavoritesRecipes()],
        ),
      ),
    );
  }
}
