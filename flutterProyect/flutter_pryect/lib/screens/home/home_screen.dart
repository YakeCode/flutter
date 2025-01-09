import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pryect/screens/home/recipe_form.dart';
import 'package:flutter_pryect/screens/recipe_detail/recipe_detail.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

// get del json
// Android: 10.0.2.2
//IOS 127.0.0.1
//web localhost
  Future<List<dynamic>> FetchRecipes() async {
    final url = Uri.parse('http://10.0.2.2:3210/recipes');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['recipes'];
      } else {
        print('Error ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error in request');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: FutureBuilder<List<dynamic>>(
              future: FetchRecipes(),
              builder: (context, snapshot) {
                final recipes = snapshot.data ?? [];
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No recipes found'));
                } else {
                  return ListView.builder(
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        return _RecipeCard(context, recipes[index]);
                      });
                }
              }),
          floatingActionButton: FloatingActionButton(
            //botón flotante
            backgroundColor: Colors.orange,
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              _showBotton(context);
            },
          ),
        ));
  }

  Future<void> _showBotton(BuildContext context) {
    //muestra un modal
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width,
          height: 500,
          color: Colors.white,
          child: ReciperFont()),
    );
  }

  Widget _RecipeCard(BuildContext context, dynamic recipe) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RecipeDetail(
                      recipeName: recipe[
                          'name']))); //navega a la pantalla de detalle y envia la receta
        },
        child: Padding(
            padding:
                const EdgeInsets.all(8.0), //padding de 8.0 en todos los lados
            child: Container(
                width: MediaQuery.of(context)
                    .size
                    .width, //toma el ancho de la pantalla
                height: 125,
                child: Card(
                  //tarjeta
                  child: Row(
                    children: <Widget>[
                      //hijos de la fila
                      Container(
                        height: 125,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            recipe['image_link']
                            /*Image.asset(
                        '../../assets/images/flutter_lasaña.jpg',*/
                            ,
                            fit: BoxFit.cover,
                          ),
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
                              recipe['name'],
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
                              recipe['author'],
                            ),
                          ])
                    ],
                  ),
                ))));
  }
}
