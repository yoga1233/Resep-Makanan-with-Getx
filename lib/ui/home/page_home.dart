import 'package:aplikasi_get/controllers/home_controller.dart';
import 'package:aplikasi_get/shared/theme_colors.dart';
import 'package:aplikasi_get/ui/home/component/categori_home.dart';
import 'package:aplikasi_get/ui/home/component/content_home.dart';
import 'package:aplikasi_get/ui/home/component/header_home.dart';
import 'package:aplikasi_get/ui/home/component/search_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageHome extends GetView<HomeController> {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightWithColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeaderHome(),
              SearchHome(),
              // CategoriHome(),
              Expanded(child: ContentHome()),
            ],
          ),
        ));
  }
}
