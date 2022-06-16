import 'package:aplikasi_get/shared/theme_text.dart';
import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 24, bottom: 16),
      child: Text(
        'Cari Resep Terbaik\nUntuk Memasak',
        style: blackTextStyle.copyWith(
          fontSize: 24,
          fontWeight: semiBold,
        ),
      ),
    );
  }
}
