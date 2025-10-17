import 'dart:convert';

import 'package:app_tesing/models/recipe_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestDataHolding with ChangeNotifier {
  RecipeList? _data;
  bool? _isLoading = false;

  RecipeList? get data => _data;
  bool get isLoading => _isLoading ?? false;

  set isLoading(bool? loading) {
    _isLoading = loading;
    notifyListeners();
  }

  set data(RecipeList? newData) {
    _data = newData;
    notifyListeners();
  }

  void clearData() {
    _data = null;
    notifyListeners();
  }

  Future<bool?> getRecipes() async {
    isLoading = true;
    final url = Uri.parse('https://dummyjson.com/recipes');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        data = RecipeList.fromJson(json); // ✅ correct usage
        return true;
      } else {
        print('Failed to load recipes');
        return false;
      }
    } catch (e) {
      print('Error fetching recipes: $e');
      return false;
    } finally {
      isLoading = false;
    }
  }
}
