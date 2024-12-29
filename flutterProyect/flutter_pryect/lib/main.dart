import 'package:flutter/material.dart';

import './screens/home.screen.dart';

void main() {
  //da inicio a la aplicación
  runApp(const MyApp()); // Primera llamada de vista de la aplicación
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const RecipeBook(),
    );
  }
}

class RecipeBook extends StatelessWidget {
  const RecipeBook({super.key});

  @override // constructor de la vista
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1, // Número de pestañas
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
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
