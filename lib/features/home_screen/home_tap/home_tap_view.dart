import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/domain/di/di.dart';
import 'package:ecommerce/features/home_screen/home_tap/cubit/home_tap_view_model.dart';
import 'package:flutter/material.dart';

class HomeTapView extends StatelessWidget {
  HomeTapViewModel viewModel = getIt<HomeTapViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.redColor,
    );
  }
}
