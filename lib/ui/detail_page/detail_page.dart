import 'package:aplikasi_get/controllers/detail_controller.dart';
import 'package:aplikasi_get/controllers/fav_controller.dart';
import 'package:aplikasi_get/shared/theme_colors.dart';
import 'package:aplikasi_get/ui/detail_page/component/komposisi_detail.dart';
import 'package:aplikasi_get/ui/detail_page/component/step_detali.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavController c = Get.put(FavController());
    return Scaffold(
        backgroundColor: whiteColor,
        body: Obx(
          () => SafeArea(
            child: !controller.isLoading.value
                ? SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Image.asset(
                                  'assets/icon_back.png',
                                  width: 24.w,
                                  height: 24.h,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    c.addToFav();
                                  },
                                  icon: Icon(
                                    controller.isFav()
                                        ? Icons.favorite_outline
                                        : Icons.favorite,
                                    color: greyColor,
                                    size: 24,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Container(
                              width: 1.sw,
                              height: 210.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      controller.recipe.value.results!.thumb
                                          .toString(),
                                    ),
                                    fit: BoxFit.cover),
                              )),
                          SizedBox(
                            height: 30.h,
                          ),
                          const KomposisiDetail(),
                          SizedBox(
                            height: 18.h,
                          ),
                          const StepDetail()
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ));
  }
}
