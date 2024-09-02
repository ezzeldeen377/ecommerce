import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef MyValidator = String? Function(String?);

class TextFormFieldWidget extends StatelessWidget {
  String hint;
  ImageIcon? icon;
  bool? obscureText;
  MyValidator? validator;
  TextEditingController controller;

  TextFormFieldWidget(
      {required this.hint,
      this.icon,
      this.obscureText,
      this.validator,
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 60.h,
      controller: controller,
      obscureText: false,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hint,
        hintStyle: getLightStyle(
            color: AppColors.blackColor.withOpacity(.5), size: FontSize.s14),
        filled: true,
        fillColor: AppColors.whiteColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
