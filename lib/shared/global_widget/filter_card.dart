import 'package:aplikasi_get/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../theme_colors.dart';
import '../theme_text.dart';

class FilterCard extends GetView<HomeController> {
  final String label;
  const FilterCard({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.addToFilter(label);
      },
      child: Obx(() => controller.isSelectedFilter(label)
          ? Container(
              width: 150.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: whiteColor, border: Border.all(color: greenColor)),
              child: Center(
                child: Text(
                  label,
                  style: blackTextStyle,
                ),
              ),
            )
          : Container(
              width: 150.w,
              height: 40.h,
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Center(
                child: Text(
                  label,
                  style: blackTextStyle,
                ),
              ),
            )),
    );
  }
}
