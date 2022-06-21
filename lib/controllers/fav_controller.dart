import 'package:aplikasi_get/controllers/home_controller.dart';
import 'package:aplikasi_get/model/fav_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavController extends GetxController {
  HomeController h = Get.find();
  RxList<FavModel> fav = <FavModel>[].obs;

  final box = GetStorage();
  bool isFav() {
    var contain = fav.where((element) => element.key == h.query.value);
    if (contain.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool checkFav() {
    if (fav.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  addToFav() {
    var contain = fav.where((element) => element.key == h.query.value);
    if (contain.isEmpty) {
      fav.add(
        FavModel(
          key: h.query.value,
          imageUrl: '',
        ),
      );
    } else {
      fav.removeWhere((element) => element.key == h.query.value);
    }

    // box.write('favorite', fav);
    // getFav();
    // print(fav.value[0].key);
  }

  removeFromFav(String key) {
    fav.removeWhere((element) => element.key == key);
    // box.write('favorite', fav);
    // List<FavModel> isfav = box.read('favorite');
  }

  // getFav() {
  //   fav.value = box.read('favorite') ?? <FavModel>[];
  // }

  // @override
  // void onInit() {
  //   // getFav();
  //   super.onInit();
  // }
}
