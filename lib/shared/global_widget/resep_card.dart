// import 'package:aplikasi_get/controllers/home_controller.dart';
import 'package:aplikasi_get/controllers/fav_controller.dart';
import 'package:aplikasi_get/controllers/home_controller.dart';
import 'package:aplikasi_get/shared/theme_colors.dart';
import 'package:aplikasi_get/shared/theme_text.dart';
import 'package:aplikasi_get/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

import '../../model/recipe_model.dart';

class ResepCard extends StatelessWidget {
  final RecipeModel recipe;
  const ResepCard(
    this.recipe, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController c = Get.find();
    FavController f = Get.find();
    return InkWell(
      onTap: () {
        c.addQuery(recipe.key);
        Get.toNamed('/detail', arguments: recipe.key);
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        height: 450.h,
        width: 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
              image: NetworkImage(recipe.images), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 24,
              top: 24,
              child: Container(
                width: 50.w,
                height: 50.h,
                padding: const EdgeInsets.symmetric(
                  vertical: 13,
                  horizontal: 13,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: brownColor,
                ),
                child: InkWell(
                  onTap: () {
                    f.addFavHome(recipe.key);
                  },
                  child: Obx(() => Image.asset(
                        f.containFav(recipe.key)
                            ? 'assets/icon_fav.png'
                            : 'assets/icon_fav_selected.png',
                        color: whiteColor,
                      )),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 1.sw,
                height: 217.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        blackColor,
                        Colors.transparent,
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    changeToSenteceCase(recipe.key),
                    style: whiteTextStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    '${recipe.difficulty} | ${recipe.time}',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16.sp, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
