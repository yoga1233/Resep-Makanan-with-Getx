import 'package:aplikasi_get/controllers/fav_controller.dart';
import 'package:aplikasi_get/shared/theme_colors.dart';
import 'package:aplikasi_get/shared/theme_text.dart';
import 'package:aplikasi_get/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavCard extends StatelessWidget {
  final String tittle;
  const FavCard(this.tittle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavController c = Get.find();
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              changeToSenteceCase(tittle),
              style: blackTextStyle,
            ),
          ),
          IconButton(
              onPressed: () {
                c.removeFromFav(tittle);
              },
              icon: const Icon(
                Icons.remove,
                color: Colors.redAccent,
              ))
        ],
      ),
    );
  }
}
