import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef MyValidator = String? Function(String?);

class TextFormFieldWidget extends StatefulWidget {
  String hint;
  ImageIcon? suffixIcon;
  bool? obscureText;
  MyValidator? validator;
  TextEditingController controller;
  bool show;
  ImageIcon? SuffixIconShowed;
  TextFormFieldWidget(
      {required this.hint,
      this.suffixIcon,
      this.obscureText,
      this.validator,
      this.show = false,
      this.SuffixIconShowed,
      required this.controller});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 60.h,
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
      validator: widget.validator,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () {
              if (widget.show == true) {
                widget.obscureText = false;
                widget.show = false;
              } else {
                widget.obscureText = true;
                widget.show = true;
              }
              setState(() {});
            },
            icon: widget.show
                ? widget.suffixIcon ?? const SizedBox.shrink()
                : widget.SuffixIconShowed ?? const SizedBox.shrink()),
        hintText: widget.hint,
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
