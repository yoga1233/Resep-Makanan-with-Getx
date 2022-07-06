import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/fav_controller.dart';
import '../../../shared/theme_colors.dart';

class AppBarDetail extends StatelessWidget {
  const AppBarDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavController c = Get.find();
    return Row(
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
        Obx(
          () => IconButton(
            onPressed: () {
              c.addToFav();
            },
            icon: Icon(
              c.isFav() ? Icons.favorite_outline : Icons.favorite,
              color: c.isFav() ? greyColor : Colors.redAccent,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
