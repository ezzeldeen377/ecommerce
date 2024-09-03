import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarItemWidget {
  static getBottomNavigationBarItemWidget(String iconPath, String label) {
    return BottomNavigationBarItem(
        activeIcon: CircleAvatar(
          backgroundColor: AppColors.whiteColor,
          child: ImageIcon(
            AssetImage(iconPath),
            color: AppColors.primaryColor,
          ),
        ),
        icon: ImageIcon(AssetImage(iconPath)),
        label: label);
  }
}
