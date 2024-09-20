import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:ecommerce/presentation/auth_presetation/forget_password/cubit/forget_password_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyTextFormField extends StatelessWidget {
  TextEditingController element;
  VerifyTextFormField({required this.element});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50.w,
        child: TextFormField(
          maxLength: 1,
          style: getBoldStyle(
              color: AppColors.primaryColor, size: FontSize.s24.sp),
          decoration: InputDecoration(
            fillColor: AppColors.whiteColor,
            filled: true,
          ),
          controller: element,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          onChanged: (value) {
            if (value.length == 1) {
              // Move focus to the next TextField when a number is entered
              if (ForgetPasswordViewModel.get(context)
                      .verifyNumbers
                      .indexOf(element) <
                  6) {
                FocusScope.of(context).nextFocus();
              } else {
                FocusScope.of(context)
                    .unfocus(); // Close the keyboard on the last field
              }
            }
            if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
            }
          },
        ));
  }
}
