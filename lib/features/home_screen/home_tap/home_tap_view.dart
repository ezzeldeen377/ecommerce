import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widgets/alert_utils.dart';
import 'package:ecommerce/core/widgets/search_widget.dart';
import 'package:ecommerce/domain/di/di.dart';
import 'package:ecommerce/features/home_screen/home_tap/cubit/home_tap_states.dart';
import 'package:ecommerce/features/home_screen/home_tap/cubit/home_tap_view_model.dart';
import 'package:ecommerce/features/home_screen/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class HomeTapView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeTapViewModel, HomeTapStates>(
        bloc: HomeTapViewModel.getInit(context)..getCategory()..getBrand(),
        builder: (context, state) {
          return SafeArea(
            child:Scaffold(
              appBar:AppBar(
                title: Image.asset(IconAssets.routelogo),
                automaticallyImplyLeading: false,
                bottom: PreferredSize(preferredSize: Size(50,30), child:Padding(
                  padding:  EdgeInsets.symmetric(horizontal: AppPadding.p5.h),
                  child: SearchWidget(),
                ),
                ),
                leading: null,
               ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppMargin.m10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: AppPadding.p5.h,
                      ),
                      ImageSlideshow(
                          initialPage: 0,
                          autoPlayInterval: 3000,
                          indicatorBackgroundColor: AppColors.whiteColor,
                          indicatorColor: AppColors.primaryColor,
                          isLoop: true,
                          indicatorBottomPadding: 20,
                          children: HomeTapViewModel.getInit(context).adsList.map((path) {
                            return ClipRect(child: Image.asset(path));
                          }).toList()),
                      SizedBox(
                        height: AppPadding.p5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ConstantManager.category,
                            style: getSemiBoldStyle(
                                color: AppColors.primaryColor, size: FontSize.s16),
                          ),
                          Text(
                            ConstantManager.viewAll,
                            style: getRegularStyle(color: AppColors.primaryColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppPadding.p5.h,
                      ),
                      SizedBox(
                          height: 270.h,
                          child: state is CategorySuccessState||state is BrandSuccessState?
                          GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                            itemBuilder: (context, index) {
                              return CategoryItem(categoryData: HomeTapViewModel.getInit(context).categoryList[index],);
                            },
                            itemCount: HomeTapViewModel.getInit(context).categoryList.length,
                            scrollDirection: Axis.horizontal,
                          ):
                          Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
                      ),
                      SizedBox(
                        height: AppPadding.p5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ConstantManager.brand,
                            style: getSemiBoldStyle(
                                color: AppColors.primaryColor, size: FontSize.s16),
                          ),
                          Text(
                            ConstantManager.viewAll,
                            style: getRegularStyle(color: AppColors.primaryColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppPadding.p5.h,
                      ),
                      SizedBox(
                          height: 300.h,
                          child: state is CategorySuccessState||state is BrandSuccessState?
                          GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                            itemBuilder: (context, index) {
                              return CategoryItem(categoryData:HomeTapViewModel.getInit(context).brandList[index],);
                            },
                            itemCount:HomeTapViewModel.getInit(context).brandList.length,
                            scrollDirection: Axis.horizontal,
                          ):
                          Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
                      ),
                    ],
                  ),
                ),
              ),
            )
          );
        });
  }
}
