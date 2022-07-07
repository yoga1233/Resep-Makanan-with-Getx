import 'package:aplikasi_get/controllers/detail_controller.dart';
import 'package:aplikasi_get/controllers/fav_controller.dart';
import 'package:aplikasi_get/shared/theme_colors.dart';
import 'package:aplikasi_get/ui/detail_page/component/app_bar_detail.dart';
import 'package:aplikasi_get/ui/detail_page/component/content_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DetailController());
    Get.put(FavController());

    return Scaffold(
        backgroundColor: whiteColor,
        body: Obx(
          () => SafeArea(
            child: !controller.isLoading.value
                ? Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppBarDetail(),
                        SizedBox(
                          height: 40.h,
                        ),
                        const Expanded(
                          child: ContentDetali(),
                        )
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ));
  }
}
