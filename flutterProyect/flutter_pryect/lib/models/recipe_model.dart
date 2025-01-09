class Recipe {
  String name;
  String author;
  String image_Link;
  List<String> recipeSteps;

  Recipe({
    required this.name,
    required this.author,
    required this.image_Link,
    required this.recipeSteps,
  });

  factory Recipe.fromJSON(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      author: json['author'],
      image_Link: json['image_link'],
      recipeSteps: List<String>.from(json['recipe']),
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'name': name,
      'author': author,
      'image_link': image_Link,
      'recipe': recipeSteps
    };
  }

  @override
  String toString() {
    return 'Recipe {name: $name, author:$author, image_link:$image_Link, recipe:$recipeSteps}';
  }
}
