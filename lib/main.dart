import 'package:aplikasi_get/routes/app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          getPages: AppPage.pages,
          theme: ThemeData(
              textTheme: TextTheme(bodyText2: TextStyle(fontSize: 14.sp))),
        );
      },
    );
  }
}
