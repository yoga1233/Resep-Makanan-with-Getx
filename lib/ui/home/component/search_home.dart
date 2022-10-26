import 'package:aplikasi_get/controllers/home_controller.dart';
import 'package:aplikasi_get/shared/global_widget/filter_card.dart';
import 'package:aplikasi_get/shared/theme_colors.dart';
import 'package:aplikasi_get/shared/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchHome extends StatelessWidget {
  const SearchHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController cSearch = TextEditingController();
    HomeController controller = Get.find();
    return Container(
      margin: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50.h,
            width: 258.w,
            child: TextFormField(
              controller: cSearch,
              onFieldSubmitted: (value) {
                controller.getRecipeFromSearch(cSearch.text);
              },
              decoration: InputDecoration(
                  hintText: 'Cari Resep Makanan',
                  hintStyle: greyTextStyle.copyWith(
                      fontWeight: light, fontSize: 14.sp),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: greyColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 12,
                  ),
                  fillColor: whiteColor,
                  filled: true,
                  border: InputBorder.none),
              enabled: true,
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Filter',
                                style: blackTextStyle.copyWith(
                                    fontSize: 18, fontWeight: medium),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.resetFilter();
                                  Get.back();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: greyColor),
                                  child: Center(
                                    child: Text(
                                      "Reset",
                                      style:
                                          blackTextStyle.copyWith(fontSize: 10),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Tingkatan',
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: const [
                              FilterCard(label: "Sulit"),
                              FilterCard(label: "Mudah"),
                              FilterCard(label: "Cukup Rumit")
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              controller.setFilter();
                              Get.back();
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: greenColor),
                              child: Center(
                                child: Text(
                                  'Terapkan Filter',
                                  style: whiteTextStyle,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  });
            },
            child: Container(
              height: 50.h,
              width: 50.w,
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 13),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: lightGreenColor),
              child: Image.asset(
                'assets/icon_filter.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
