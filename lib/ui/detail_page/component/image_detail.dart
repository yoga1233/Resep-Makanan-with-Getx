import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/detail_controller.dart';

class ImageDetail extends GetView<DetailController> {
  const ImageDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(),
        width: 1.sw,
        height: 210.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
              image: NetworkImage(
                controller.recipe.value.results!.thumb.toString(),
              ),
              fit: BoxFit.cover),
        ));
  }
}
