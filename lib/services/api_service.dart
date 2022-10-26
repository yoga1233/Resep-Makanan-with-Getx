// ignore_for_file: unused_import

import 'package:aplikasi_get/model/detai_recipel_model.dart';
import 'package:aplikasi_get/model/recipe_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  String baseUrl = 'https://masak-apa.tomorisakura.vercel.app/';
  final dio = Dio();

  Future<List<RecipeModel>> getNewRecipe() async {
    String url = '${baseUrl}api/recipes';
    dio.interceptors.add(dioLoggerInterceptor);

    try {
      var result = await dio.get(url);
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
    dio.interceptors.add(dioLoggerInterceptor);
    try {
      var result = await dio.get(url);
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
    dio.interceptors.add(dioLoggerInterceptor);
    try {
      var result = await dio.get(url);
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
