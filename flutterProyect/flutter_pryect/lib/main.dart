import 'package:flutter/material.dart';

void main() {
  //da inicio a la aplicacion
  runApp(const MyApp()); // Primera llamada de vista de la aplicacion
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: RecipeBook());
  }
}

class RecipeBook extends StatelessWidget {
  const RecipeBook({super.key});

  @override // constructor de la vista
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: const Text(
            'Recipe Book',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'roboto',
                fontSize: 25.0,
                fontWeight: FontWeight.w500),
          ),
        ),
        // cuerpo de la vista
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: 125,
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 125,
                    width: 100,
                    child: ClipRRect(
                      //Permite bordes redondeados
                      borderRadius: BorderRadius.circular(10),
                      child: Container(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  ),
                  Column(children: <Widget>[
                    Text('lasagna'),
                    Text('autor : YaKe'),
                    Container(
                      height: 1,
                      width: 75,
                      color: Colors.orange,
                    )
                  ])
                ],
              ),
            )));
  }
}
