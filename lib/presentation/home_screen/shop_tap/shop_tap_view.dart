import 'dart:convert';

import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes_manager/routes.dart';
import 'package:ecommerce/core/widgets/search_widget.dart';
import 'package:ecommerce/core/widgets/shared_preferences_utils.dart';
import 'package:ecommerce/presentation/home_screen/cart_details/cubit/cart_details_view_model.dart';
import 'package:ecommerce/presentation/home_screen/shop_tap/cubit/shop_tap_states.dart';
import 'package:ecommerce/presentation/home_screen/shop_tap/cubit/shop_tap_view_model.dart';
import 'package:ecommerce/presentation/home_screen/shop_tap/product_details_view.dart';
import 'package:ecommerce/presentation/home_screen/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopTapView extends StatelessWidget {
  const ShopTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<ShopTabViewModel, ShopTapStates>(
            bloc: ShopTabViewModel.get(context)..getAllProducts(),
            builder: (context, state) {
              return Scaffold(
                  backgroundColor: AppColors.whiteColor,
                  appBar: AppBar(
                    backgroundColor: AppColors.whiteColor,
                    title: Image.asset(IconAssets.routelogo),
                    automaticallyImplyLeading: false,
                    bottom: PreferredSize(
                      preferredSize: Size(50, 30),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppPadding.p5.h),
                        child: SearchWidget(),
                      ),
                    ),
                  ),
                  body: ShopTabViewModel.get(context).productList.isNotEmpty &&
                          CartDetailsViewModel.get(context).cart != null
                      ? Padding(
                          padding:
                              const EdgeInsets.only(left: 8, right: 8, top: 5),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 9 / 12.5,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5),
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    ShopTabViewModel.get(context)
                                        .selectedColor = null;
                                    ShopTabViewModel.get(context).selectedSize =
                                        null;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailsView(
                                                    product: ShopTabViewModel
                                                            .get(context)
                                                        .productList[index])));
                                  },
                                  child: ProductItem(
                                    product: ShopTabViewModel.get(context)
                                        .productList[index],
                                  ));
                            },
                            itemCount: ShopTabViewModel.get(context)
                                .productList
                                .length,
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )));
            }));
  }
}
