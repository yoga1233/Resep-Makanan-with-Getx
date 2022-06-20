import 'package:aplikasi_get/controllers/detail_controller.dart';
import 'package:aplikasi_get/shared/theme_colors.dart';
import 'package:aplikasi_get/shared/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                color: lightGreenColor),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            'Komposisi',
                            style: blackTextStyle.copyWith(
                                fontSize: 16.sp, fontWeight: semiBold),
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller
                                .recipe.value.results!.ingredient!.length,
                            itemBuilder: (context, index) => Text(controller
                                .recipe.value.results!.ingredient![index]),
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          Text(
                            'Langkah - Langkah',
                            style: blackTextStyle.copyWith(
                                fontSize: 16.sp, fontWeight: semiBold),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                controller.recipe.value.results!.step!.length,
                            itemBuilder: (context, index) => Text(
                                controller.recipe.value.results!.step![index]),
                          ),
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
