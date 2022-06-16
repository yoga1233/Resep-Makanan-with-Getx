import 'package:aplikasi_get/shared/theme_colors.dart';
import 'package:aplikasi_get/shared/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageSplash extends StatelessWidget {
  const PageSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'assets/image_splash_page.png',
          width: 1.sw,
          height: 1.sh,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 1.sw,
            height: 312.h,
            decoration: BoxDecoration(
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
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Pengalaman Memasak\nSeperti Seorang Koki',
                style:
                    whiteTextStyle.copyWith(fontSize: 24.sp, fontWeight: bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Ayo buat makanan lezat untuk\nkeluarga tercinta anda',
                style: whiteTextStyle.copyWith(
                  fontSize: 16.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.h,
              ),
              InkWell(
                onTap: () {
                  Get.offNamedUntil('/main-page', (route) => false);
                },
                child: Container(
                  height: 50.h,
                  width: 153.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: greenColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: whiteColor),
                        child: Image.asset('assets/icon_forward.png'),
                      ),
                      Text(
                        'Get Started',
                        style: whiteTextStyle.copyWith(
                            fontSize: 13.sp, fontWeight: medium),
                      ),
                      const SizedBox()
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              )
            ],
          ),
        )
      ],
    ));
  }
}
