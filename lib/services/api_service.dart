import 'package:aplikasi_get/model/recipe_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  String baseUrl = 'http://api-food-recipe.herokuapp.com/';

  Future<List<RecipeModel>> getNewRecipe() async {
    String url = '${baseUrl}recipe';

    try {
      var result = await Dio().get(url);
      if (result.statusCode == 200) {
        List data = result.data['data'];

        List<RecipeModel> newRecipe =
            data.map((e) => RecipeModel.fromJson(e)).toList();
        return newRecipe;
      }
      return <RecipeModel>[];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<RecipeModel>> getRecipeFromSearch(String query) async {
    String url = '${baseUrl}search?q=$query';
    try {
      var result = await Dio().get(url);
      if (result.statusCode == 200) {
        List data = result.data['data'];
        List<RecipeModel> newRecipe =
            data.map((e) => RecipeModel.fromJson(e)).toList();
        return newRecipe;
      }
      return <RecipeModel>[];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<RecipeModel>> getRecipeFromCategori(String query) async {
    String url = '${baseUrl}categories/$query';
    try {
      var result = await Dio().get(url);
      if (result.statusCode == 200) {
        List data = result.data['data'];
        List<RecipeModel> newRecipe =
            data.map((e) => RecipeModel.fromJson(e)).toList();
        return newRecipe;
      }
      return <RecipeModel>[];
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
