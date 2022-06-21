import 'package:get/get.dart';

import '../controllers/fav_controller.dart';

class FavBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavController>(() => FavController());
  }
}
