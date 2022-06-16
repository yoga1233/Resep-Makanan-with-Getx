import 'package:aplikasi_get/model/recipe_model.dart';
import 'package:aplikasi_get/services/api_service.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  RxList<RecipeModel> newRecipe = <RecipeModel>[].obs;

  RxBool isLoading = false.obs;
  RxInt indexPage = 1.obs;

  RxBool isFav = false.obs;

  void isFavorite() {
    isFav.toggle();
  }

  setIndexPage(int index) {
    indexPage.value = index;
  }

  Future<void> getNewRecipe() async {
    try {
      isLoading(true);
      newRecipe.value = await ApiService().getNewRecipe();
      isLoading(false);
    } catch (e) {
      rethrow;
    }
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

  @override
  void onInit() {
    getNewRecipe();
    super.onInit();
  }
}
