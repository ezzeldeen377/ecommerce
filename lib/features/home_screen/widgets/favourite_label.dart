import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';

class FavouriteLabel extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         shape: BoxShape.circle,
        color: AppColors.whiteColor,

      ),
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: (){},
          child: ImageIcon(AssetImage(IconAssets.favourite),color: AppColors.primaryColor,)),
    );
  }
}
