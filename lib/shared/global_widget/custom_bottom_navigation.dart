import 'package:aplikasi_get/controllers/home_controller.dart';
import 'package:aplikasi_get/shared/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomNavigation extends StatelessWidget {
  final String imageUrl;
  final int index;
  const CustomBottomNavigation(
      {Key? key, required this.index, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController c = Get.find();

    return InkWell(
      onTap: () {
        c.setIndexPage(index);
      },
      child: Obx(() => Image.asset(
            imageUrl,
            color: c.indexPage.value == index ? blackColor : greyColor,
            width: 24.w,
            height: 24.h,
          )),
    );
  }
}
