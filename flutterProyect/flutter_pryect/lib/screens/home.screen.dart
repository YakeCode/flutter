import 'package:flutter/material.dart';

const String author = 'Yake';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            body: Column(
          children: <Widget>[
            _RecipeCard(context),
            _RecipeCard(context),
          ],
        )));
  }

  Widget _RecipeCard(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0), //padding de 8.0 en todos los lados
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 125,
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 125,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      //Permite bordes redondeados
                      borderRadius: BorderRadius.circular(10),
                      child: Container(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  ),
                  Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, //centra los elementos
                      crossAxisAlignment: CrossAxisAlignment
                          .start, //alinea los elementos internos a la izquierda
                      children: <Widget>[
                        Text(
                          'Lasagna',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 1,
                          width: 75,
                          color: Colors.orange,
                        ),
                        Text(
                          'autor: ${author}',
                        ),
                      ])
                ],
              ),
            )));
  }
}
