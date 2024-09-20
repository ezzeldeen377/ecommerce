import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widgets/search_widget.dart';
import 'package:ecommerce/presentation/home_screen/favourite_tap/cubit/favourite_tab_states.dart';
import 'package:ecommerce/presentation/home_screen/favourite_tap/cubit/favourite_tab_view_model.dart';
import 'package:ecommerce/presentation/home_screen/shop_tap/cubit/shop_tap_view_model.dart';
import 'package:ecommerce/presentation/home_screen/widgets/wish_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteTapView extends StatelessWidget {
  const FavouriteTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<FavouriteTabViewModel, FavouriteTabStates>(
            bloc: FavouriteTabViewModel.get(context)..GetAllWishist(),
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
                      )),
                  body: FavouriteTabViewModel.get(context).wishList != null
                      ? ListView.builder(
                          itemBuilder: (context, index) => WishListItem(
                              product: FavouriteTabViewModel.get(context)
                                  .wishList![index]),
                          itemCount: FavouriteTabViewModel.get(context)
                              .wishList
                              ?.length,
                        )
                      : Center(
                          child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )));
            }));
  }
}
