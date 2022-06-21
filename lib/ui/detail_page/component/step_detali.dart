import 'package:aplikasi_get/controllers/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../shared/theme_text.dart';
import '../../../utils/helper.dart';

class StepDetail extends StatelessWidget {
  const StepDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailController c = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Langkah - Langkah',
          style: blackTextStyle.copyWith(fontSize: 16.sp, fontWeight: semiBold),
        ),
        SizedBox(
          height: 16.h,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: c.recipe.value.results!.step!.length,
          itemBuilder: (context, index) => Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('${index + 1}. '),
                  Flexible(
                    child: Text(
                      remove(c.recipe.value.results!.step![index]),
                      style: blackTextStyle,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              )
            ],
          ),
        ),
      ],
    );
  }
}
