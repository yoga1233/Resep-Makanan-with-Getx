import 'package:aplikasi_get/model/detai_recipel_model.dart';
import 'package:aplikasi_get/model/recipe_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  String baseUrl = 'https://masak-apa.tomorisakura.vercel.app/';

  Future<List<RecipeModel>> getNewRecipe() async {
    String url = '${baseUrl}api/recipes';

    try {
      var result = await Dio().get(url);
      if (result.statusCode == 200) {
        List data = result.data['results'];

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
    String url = '${baseUrl}api/search/?q=$query';
    try {
      var result = await Dio().get(url);
      if (result.statusCode == 200) {
        List data = result.data['results'];
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

  Future<DetailRecipeModel> getDetailRecipe(String query) async {
    String url = '${baseUrl}api/recipe/$query';
    try {
      var result = await Dio().get(url);

      if (result.statusCode == 200) {
        var data = result.data;
        DetailRecipeModel detailRecipe = DetailRecipeModel.fromJson(data);
        return detailRecipe;
      }
      return DetailRecipeModel();
    } catch (e) {
      rethrow;
    }
  }
}
