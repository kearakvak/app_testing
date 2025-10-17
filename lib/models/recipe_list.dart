import 'package:app_tesing/models/recipe.dart';

class RecipeList {
  final List<Recipe> recipes;

  RecipeList({required this.recipes});

  factory RecipeList.fromJson(Map<String, dynamic> json) {
    return RecipeList(
      recipes: (json['recipes'] as List)
          .map((item) => Recipe.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'recipes': recipes.map((item) => item.toJson()).toList()};
  }
}
