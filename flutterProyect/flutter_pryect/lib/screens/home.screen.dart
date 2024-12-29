import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
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
                ))));
  }
}
