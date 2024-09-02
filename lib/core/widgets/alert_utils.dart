import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Alert {
  static void showLoading(
      {required BuildContext context, required String message}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.primaryColor,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: AppColors.whiteColor),
                SizedBox(
                  width: AppPadding.p10.h,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  message,
                  style: getMediumStyle(
                      color: AppColors.whiteColor, size: FontSize.s14),
                )
              ],
            ),
          );
        });
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.of(context).pop();
  }

  static void showAlert(
      {required BuildContext context,
      String title = '',
      required String content,
      String? firstbutton,
      String? secondbutton,
      Function? firstAction,
      Function? SecondAction}) {
    List<Widget> actionList = [];
    if (firstbutton != null) {
      actionList.add(TextButton(
        onPressed: () {
          firstAction != null
              ? firstAction.call()
              : Navigator.of(context).pop();
        },
        child: Text(
          firstbutton,
          style:
              getMediumStyle(color: AppColors.whiteColor, size: FontSize.s16),
        ),
      ));
    }
    if (secondbutton != null) {
      actionList.add(TextButton(
        onPressed: () {
          SecondAction != null
              ? SecondAction.call()
              : Navigator.of(context).pop();
        },
        child: Text(
          secondbutton,
          style:
              getMediumStyle(color: AppColors.whiteColor, size: FontSize.s16),
        ),
      ));
    }
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            backgroundColor: AppColors.primaryColor,
            title: Text(
              title,
              style: getSemiBoldStyle(
                  color: AppColors.whiteColor, size: FontSize.s20),
            ),
            content: Text(
              content,
              style: getMediumStyle(
                  color: AppColors.whiteColor, size: FontSize.s14),
            ),
            actions: actionList));
  }
}
