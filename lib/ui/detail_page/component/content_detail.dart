import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_detail.dart';
import 'komposisi_detail.dart';
import 'step_detali.dart';

class ContentDetali extends StatelessWidget {
  const ContentDetali({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ImageDetail(),
        SizedBox(
          height: 30.h,
        ),
        const KomposisiDetail(),
        SizedBox(
          height: 18.h,
        ),
        const StepDetail()
      ],
    );
  }
}
