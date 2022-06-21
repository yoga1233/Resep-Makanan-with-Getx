import 'package:aplikasi_get/controllers/fav_controller.dart';
import 'package:aplikasi_get/controllers/home_controller.dart';
import 'package:aplikasi_get/model/detai_recipel_model.dart';
import 'package:aplikasi_get/services/api_service.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  HomeController c = Get.find();
  FavController f = Get.find();
  Rx<DetailRecipeModel> recipe = DetailRecipeModel().obs;
  RxBool isLoading = false.obs;

  Future getDetailRecipe() async {
    isLoading.value = true;
    recipe.value = await ApiService().getDetailRecipe(c.query.value);
    isLoading.value = false;
  }

  bool isFav() {
    var contain = f.fav.where((element) => element.key == c.query.value);
    if (contain.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onInit() {
    getDetailRecipe();
    super.onInit();
  }
}
