import 'package:aplikasi_get/shared/theme_colors.dart';
import 'package:aplikasi_get/shared/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriCard extends StatelessWidget {
  final String label;
  final Function() onTap;
  const CategoriCard({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          right: 20,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: greenColor,
        ),
        child: Text(
          label,
          style: whiteTextStyle.copyWith(fontSize: 18.sp, fontWeight: medium),
        ),
      ),
    );
  }
}
