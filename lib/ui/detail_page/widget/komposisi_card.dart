import 'package:aplikasi_get/shared/theme_colors.dart';
import 'package:aplikasi_get/shared/theme_text.dart';
import 'package:flutter/material.dart';

class KomposisiCard extends StatelessWidget {
  final String komposisi;
  const KomposisiCard(this.komposisi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: lightGreenColor,
      ),
      child: Text(
        komposisi,
        style: blackTextStyle,
      ),
    );
  }
}
