import 'package:aplikasi_get/controllers/home_controller.dart';
import 'package:aplikasi_get/shared/global_widget/resep_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentHome extends GetView<HomeController> {
  const ContentHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Obx(() => !controller.isLoading.value
            ? controller.newRecipe.isNotEmpty
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    primary: false,
                    itemCount: controller.newRecipe.length,
                    itemBuilder: (context, index) {
                      return ResepCard(controller.newRecipe[index]);
                    },
                  )
                : const Center(
                    child: Text(
                      "Makanan tidak di temukan",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  )
            : const Center(
                child: CircularProgressIndicator(),
              )));
  }
}
