import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/widgets/alert_utils.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce/presentation/home_screen/favourite_tap/cubit/favourite_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteLabel extends StatelessWidget {
  ProductEntity product;
  FavouriteLabel({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          FavouriteTabViewModel.get(context).addItemToWishList(product.id!);
        },
        child: Image.asset(
          ImageAssets.favourite,
          width: 55.w,
          fit: BoxFit.fill,
        ));
  }
}
