import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(height: 60.h,

            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(color: AppColors.primaryColor, width: 1.h)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(color: AppColors.primaryColor, width: 1.h)),
                  prefixIcon: ImageIcon(
                    AssetImage(
                      IconAssets.search,
                    ),
                    color: AppColors.primaryColor,
                    size: 20.h,
                  ),
                  hintText: ConstantManager.searchFor,
                  hintStyle: getRegularStyle(
                      color: AppColors.blackColor.withOpacity(.4), size: 16)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: AppMargin.m20),
          child: ImageIcon(
            AssetImage(IconAssets.cart),
            color: AppColors.primaryColor,
            size: 35,
          ),
        ),
      ],
    );
  }
}
