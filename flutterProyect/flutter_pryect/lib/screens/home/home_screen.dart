import 'package:flutter/material.dart';
import 'package:flutter_pryect/providers/recipes_provider.dart';
import 'package:flutter_pryect/screens/home/recipe_form.dart';
import 'package:flutter_pryect/screens/recipe_detail/recipe_detail.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Llama a fetchRecipes en initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final recipesProvider =
          Provider.of<RecipesProvider>(context, listen: false);
      recipesProvider.FetchRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Consumer<RecipesProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (provider.recipes.isEmpty) {
              return const Center(child: Text('No recipes found'));
            } else {
              return ListView.builder(
                itemCount: provider.recipes.length,
                itemBuilder: (context, index) {
                  return _RecipeCard(context, provider.recipes[index]);
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            _showBottom(context);
          },
        ),
      ),
    );
  }

  Future<void> _showBottom(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        color: Colors.white,
        child: ReciperFont(),
      ),
    );
  }

  Widget _RecipeCard(BuildContext context, dynamic recipe) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetail(recipesData: recipe),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 125,
          child: Card(
            child: Row(
              children: <Widget>[
                Container(
                  height: 125,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      recipe.image_Link,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 26),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      recipe.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      height: 1,
                      width: 75,
                      color: Colors.orange,
                    ),
                    Text('By ${recipe.author}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
