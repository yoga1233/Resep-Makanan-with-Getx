import 'package:aplikasi_get/controllers/fav_controller.dart';
import 'package:aplikasi_get/controllers/home_controller.dart';
import 'package:aplikasi_get/shared/global_widget/custom_bottom_navigation.dart';
import 'package:aplikasi_get/shared/theme_colors.dart';
import 'package:aplikasi_get/shared/theme_text.dart';
import 'package:aplikasi_get/ui/fav_page/fave_page.dart';
import 'package:aplikasi_get/ui/home/page_home.dart';
import 'package:aplikasi_get/ui/setting_page/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainPage extends GetView<HomeController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    FavController c = Get.find();

    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 1:
          return const PageHome();
        case 2:
          return const FavPage();
        case 3:
          return const SettingPage();
        default:
          return const PageHome();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Stack(
          children: [
            buildContent(controller.indexPage.value),
            Positioned(
              bottom: 0,
              child: Container(
                width: 1.sw,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 24,
                ),
                color: lightWithColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CustomBottomNavigation(
                      index: 1,
                      imageUrl: 'assets/icon_home_selected.png',
                    ),
                    c.fav.isNotEmpty
                        ? Stack(
                            children: [
                              const CustomBottomNavigation(
                                index: 2,
                                imageUrl: 'assets/icon_fav_selected.png',
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.redAccent,
                                      border: Border.all(
                                          color: whiteColor, width: 1)),
                                  child: Center(
                                    child: Text(
                                      c.fav.length.toString(),
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 8, fontWeight: bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const CustomBottomNavigation(
                            index: 2,
                            imageUrl: 'assets/icon_fav_selected.png',
                          ),
                    const CustomBottomNavigation(
                      index: 3,
                      imageUrl: 'assets/icon_setting_selected.png',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
