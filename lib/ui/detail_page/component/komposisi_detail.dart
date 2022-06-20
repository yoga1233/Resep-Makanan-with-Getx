import 'package:aplikasi_get/controllers/detail_controller.dart';
import 'package:aplikasi_get/ui/detail_page/widget/komposisi_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../shared/theme_text.dart';

class KomposisiDetail extends StatelessWidget {
  const KomposisiDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailController c = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Komposisi',
          style: blackTextStyle.copyWith(fontSize: 16.sp, fontWeight: semiBold),
        ),
        SizedBox(
          height: 18.h,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: c.recipe.value.results!.ingredient!.length,
          itemBuilder: (context, index) =>
              KomposisiCard(c.recipe.value.results!.ingredient![index]),
        ),
      ],
    );
  }
}
