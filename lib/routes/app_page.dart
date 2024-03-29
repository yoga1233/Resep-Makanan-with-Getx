import 'package:aplikasi_get/binding/fav_binding.dart';
import 'package:aplikasi_get/binding/setting_binding.dart';
import 'package:aplikasi_get/ui/detail_page/detail_page.dart';
import 'package:aplikasi_get/ui/fav_page/fave_page.dart';
import 'package:aplikasi_get/ui/home/page_home.dart';
import 'package:aplikasi_get/ui/main_page/main_page.dart';
import 'package:aplikasi_get/ui/setting_page/setting_page.dart';
import 'package:aplikasi_get/ui/splash_page/page_splash.dart';
import 'package:get/get.dart';

import '../binding/detail_binding.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: '/',
      page: () => const PageSplash(),
    ),
    GetPage(
      name: '/home',
      page: () => const PageHome(),
    ),
    GetPage(
      name: '/main-page',
      page: () => const MainPage(),
      binding: FavBinding(),
    ),
    GetPage(
      name: '/detail',
      page: () => const DetailPage(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: '/fav',
      page: () => const FavPage(),
      binding: FavBinding(),
    ),
    GetPage(
      name: '/setting',
      page: () => const SettingPage(),
      binding: SettingBinding(),
    ),
  ];
}
