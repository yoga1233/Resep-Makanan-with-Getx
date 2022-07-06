import 'package:aplikasi_get/controllers/fav_controller.dart';
import 'package:aplikasi_get/ui/fav_page/widgets/fav_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavPage extends GetView<FavController> {
  const FavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavController c = Get.put(FavController());
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
            child: !c.checkFav()
                ? ListView.builder(
                    itemCount: c.fav.length,
                    itemBuilder: (context, index) {
                      return FavCard(c.fav[index].key.toString());
                    },
                  )
                : Text('Belum ada Resep Favorit'),
          ),
        ),
      ),
    );
  }
}
