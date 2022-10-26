// ignore_for_file: unused_import

import 'package:aplikasi_get/model/recipe_model.dart';
import 'package:aplikasi_get/services/api_service.dart';
import 'package:aplikasi_get/services/method.dart';
import 'package:aplikasi_get/services/service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<RecipeModel> newRecipe = <RecipeModel>[].obs;
  RxList<RecipeModel> saveRecipe = <RecipeModel>[].obs;
  RxList<RecipeModel> filterRecipe = <RecipeModel>[].obs;
  RxBool isFilter = false.obs;

  RxString query = ''.obs;

  RxBool isLoading = false.obs;
  RxInt indexPage = 1.obs;

  RxBool isFav = false.obs;
  RxString selectedTingkatan = ''.obs;

  addToFilter(String index) {
    selectedTingkatan.value = index;
  }

  bool isSelectedFilter(String index) {
    if (selectedTingkatan.value == index) {
      return true;
    }

    return false;
  }

  addQuery(String queryKey) => query.value = queryKey;

  void isFavorite() {
    isFav.toggle();
  }

  setIndexPage(int index) {
    indexPage.value = index;
  }

  // isFilter() {
  //   RecipeModel filterRecipe = newRecipe.where((element) => element.difficulty.contains());
  // }

  Future<void> getNewRecipe() async {
    try {
      isLoading(true);
      saveRecipe.value = await ApiService().getNewRecipe();
      newRecipe = saveRecipe;
      isLoading(false);
    } catch (e) {
      rethrow;
    }
    // try {
    //   isLoading(true);
    //   final r = await CobaService().request(
    //       url: "https://masak-apa.tomorisakura.vercel.app/api/recipes",
    //       method: Method.GET);
    //   isLoading(false);
    //   final List data = r[0];
    //   newRecipe(RxList.from(data.map((e) => RecipeModel.fromJson(e))));
    // } catch (e) {
    //   rethrow;
    // }
  }

  Future<void> getRecipeFromSearch(String query) async {
    try {
      isLoading(true);
      newRecipe.value = await ApiService().getRecipeFromSearch(query);
      isLoading(false);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getRecipeFromCategory() async {
    try {
      await ApiService().getRecipeFromCategori('resep-dessert');
    } catch (e) {
      rethrow;
    }
  }

  setFilter() async {
    try {
      isLoading(true);
      filterRecipe.value = saveRecipe
          .where((item) => item.difficulty == selectedTingkatan.value)
          .toList();
      newRecipe = filterRecipe;

      isLoading(false);
    } catch (e) {
      rethrow;
    }
  }

  resetFilter() async {
    isLoading(true);
    var data = saveRecipe;

    newRecipe = data;

    isLoading(false);
    selectedTingkatan.value = '';
  }

  @override
  void onInit() {
    getNewRecipe();
    super.onInit();
  }
}
