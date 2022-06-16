import 'package:aplikasi_get/shared/global_widget/catergori_card.dart';
import 'package:flutter/material.dart';

class CategoriHome extends StatelessWidget {
  const CategoriHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 24,
        bottom: 16,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategoriCard(
              label: 'All',
              onTap: () {},
            ),
            CategoriCard(
              label: 'Dessert',
              onTap: () {},
            ),
            CategoriCard(
              label: 'Traditional',
              onTap: () {},
            ),
            CategoriCard(
              label: 'Makan Malam',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
