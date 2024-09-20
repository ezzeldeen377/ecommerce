import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:flutter/material.dart';

class SnakeBarUtiles {
  static showMySnakeBar(BuildContext context, String message) {
    var snack = SnackBar(
      elevation: 5,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      content: Text(
        message,
        style: getMediumStyle(color: AppColors.primaryColor),
      ),
      backgroundColor: AppColors.whiteColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
