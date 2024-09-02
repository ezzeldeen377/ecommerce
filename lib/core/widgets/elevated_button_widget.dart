import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  String text;
  Function onPressed;

  ElevatedButtonWidget({required this.text,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
        onPressed: (){
        onPressed.call();
        },
        child: Text(text,
          style: getBoldStyle(color: AppColors.primaryColor,size: FontSize.s20),
        )
    );
  }
}
