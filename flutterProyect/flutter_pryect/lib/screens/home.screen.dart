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
          ),
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

  Widget _RecipeCard(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0), //padding de 8.0 en todos los lados
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
                        /*Image.asset(
                        '../../assets/images/flutter_lasaña.jpg',*/
                        'https://static.platzi.com/media/uploads/flutter_lasana_b894f1aee1.jpg',
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
