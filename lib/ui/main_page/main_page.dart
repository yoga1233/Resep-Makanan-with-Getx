import 'package:aplikasi_get/controllers/home_controller.dart';
import 'package:aplikasi_get/shared/global_widget/custom_bottom_navigation.dart';
import 'package:aplikasi_get/shared/theme_colors.dart';
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
                  children: const [
                    CustomBottomNavigation(
                      index: 1,
                      imageUrl: 'assets/icon_home_selected.png',
                    ),
                    CustomBottomNavigation(
                      index: 2,
                      imageUrl: 'assets/icon_fav_selected.png',
                    ),
                    CustomBottomNavigation(
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
