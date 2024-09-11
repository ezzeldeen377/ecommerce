import 'package:cached_network_image/cached_network_image.dart';
import 'package:customizable_counter/customizable_counter.dart';
import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce/features/home_screen/cart_details/cubit/cart_details_view_model.dart';
import 'package:ecommerce/features/home_screen/home_tap/cubit/home_tap_view_model.dart';
import 'package:ecommerce/features/home_screen/shop_tap/cubit/shop_tap_states.dart';
import 'package:ecommerce/features/home_screen/shop_tap/cubit/shop_tap_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsView extends StatelessWidget {
  ProductEntity product;
  ProductDetailsView({required this.product});
  @override
  Widget build(BuildContext context) {
    ShopTabViewModel.get(context).changeCount(
        CartDetailsViewModel.get(context).getCount(product.id ?? ''));
    ShopTabViewModel.get(context).updateTotalPrice(
        (product.price! * ShopTabViewModel.get(context).count).toInt());
    return BlocBuilder<ShopTabViewModel, ShopTapStates>(
        bloc: ShopTabViewModel.get(context),
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
              backgroundColor: AppColors.whiteColor,
              title: Text(
                ConstantManager.productDetails,
                style: getMediumStyle(
                    color: AppColors.blackColor, size: FontSize.s20),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p10.w),
                  child: ImageIcon(
                    AssetImage(IconAssets.search),
                    color: AppColors.primaryColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p10.w),
                  child: ImageIcon(
                    AssetImage(IconAssets.cart),
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageSlideshow(
                        initialPage: 0,
                        autoPlayInterval: 3000,
                        indicatorBackgroundColor: AppColors.whiteColor,
                        indicatorColor: AppColors.primaryColor,
                        isLoop: true,
                        children: product.images!.map((path) {
                          return CachedNetworkImage(
                            imageUrl: path,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color:
                                        AppColors.primaryColor.withOpacity(.5),
                                    width: 1),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                                height: 100.h,
                                child:
                                    Center(child: CircularProgressIndicator())),
                            errorWidget: (context, url, error) => Container(
                                height: 100.h,
                                child: Center(child: Icon(Icons.error))),
                          );
                        }).toList()),
                    SizedBox(
                      height: AppPadding.p10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            product.title ?? '',
                            style: getMediumStyle(
                                color: AppColors.blackColor,
                                size: FontSize.s18),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Expanded(
                            child: Text(
                          'EGP ${product.price}',
                          style: getMediumStyle(
                              color: AppColors.blackColor, size: FontSize.s18),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: AppPadding.p10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 250.w,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p16.w,
                                    vertical: AppPadding.p8.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: AppColors.primaryColor
                                            .withOpacity(.5)),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  '${product.sold.toString()} Sold',
                                  style: getSemiBoldStyle(
                                      color: AppColors.blackColor,
                                      size: FontSize.s14),
                                ),
                              ),
                              SizedBox(
                                width: AppPadding.p20.w,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: AppColors.yellowColor,
                              ),
                              SizedBox(
                                width: AppPadding.p5.w,
                              ),
                              Text(
                                '${product.ratingsAverage} (${product.ratingsQuantity})',
                                style: getMediumStyle(
                                    color: AppColors.blackColor,
                                    size: FontSize.s18),
                              )
                            ],
                          ),
                        ),
                        CustomizableCounter(
                          borderRadius: 50,
                          borderWidth: 0,
                          buttonText: ConstantManager.chooseAmount,
                          backgroundColor: AppColors.primaryColor,
                          textColor: Colors.white,
                          textSize: FontSize.s16.sp,
                          count: ShopTabViewModel.get(context).count,
                          step: 1,
                          minCount: 0,
                          maxCount: product.quantity!.toDouble(),
                          incrementIcon: const Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                          ),
                          decrementIcon: const Icon(
                            Icons.remove_circle_outline,
                            color: Colors.white,
                          ),
                          onCountChange: (count) {},
                          onIncrement: (count) {
                            ShopTabViewModel.get(context).changeCount(count);
                            ShopTabViewModel.get(context).updateTotalPrice(
                                product.price!.toInt() * count.toInt());
                          },
                          onDecrement: (count) {
                            ShopTabViewModel.get(context).changeCount(count);
                            ShopTabViewModel.get(context).updateTotalPrice(
                                product.price!.toInt() * count.toInt());
                          },
                        ),
                      ],
                    ),
                    Text(
                      ConstantManager.description,
                      style:
                          getMediumStyle(color: AppColors.blackColor, size: 18),
                    ),
                    ReadMoreText(
                      product.description ?? '',
                      trimMode: TrimMode.Line,
                      trimLines: 2,
                      colorClickableText: AppColors.primaryColor,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor),
                      lessStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor),
                      style: getRegularStyle(
                          color: AppColors.blackColor, size: 14),
                    ),
                    Text(
                      ConstantManager.size,
                      style:
                          getMediumStyle(color: AppColors.blackColor, size: 18),
                    ),
                    Row(
                      children:
                          ShopTabViewModel.get(context).sizeList.map((value) {
                        return GestureDetector(
                          onTap: () {
                            ShopTabViewModel.get(context).changeSize(value);
                          },
                          child: CircleAvatar(
                            backgroundColor:
                                ShopTabViewModel.get(context).selectedSize ==
                                        value
                                    ? AppColors.primaryColor
                                    : AppColors.whiteColor,
                            foregroundColor:
                                ShopTabViewModel.get(context).selectedSize ==
                                        value
                                    ? AppColors.whiteColor
                                    : AppColors.primaryColor,
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                    ),
                    Text(
                      ConstantManager.color,
                      style:
                          getMediumStyle(color: AppColors.blackColor, size: 18),
                    ),
                    Row(
                        children: ShopTabViewModel.get(context)
                            .colorMap
                            .entries
                            .map((entery) {
                      return GestureDetector(
                          onTap: () {
                            ShopTabViewModel.get(context)
                                .changeColor(entery.key);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.p5.w),
                            child: CircleAvatar(
                              backgroundColor: entery.value,
                              child:
                                  ShopTabViewModel.get(context).selectedColor ==
                                          entery.key
                                      ? Icon(
                                          Icons.check,
                                          color: AppColors.whiteColor,
                                        )
                                      : null,
                            ),
                          ));
                    }).toList()),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: AppColors.whiteColor,
              height: 102.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        ConstantManager.totalItemPrice,
                        style: getMediumStyle(
                            color: AppColors.blackColor.withOpacity(.8),
                            size: 18),
                      ),
                      Text(
                        'EGP ${ShopTabViewModel.get(context).totalPrice}',
                        style: getMediumStyle(
                            color: AppColors.blackColor, size: FontSize.s18),
                      )
                    ],
                  ),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: AppColors.whiteColor),
                      label: Text(ConstantManager.addToCart),
                      onPressed: () async {
                        if (CartDetailsViewModel.get(context)
                            .checkItemInCart(product.id!)!) {
                          if (ShopTabViewModel.get(context).count != 0) {
                            CartDetailsViewModel.get(context)
                                .updateItemQuantity(product.id!,
                                    ShopTabViewModel.get(context).count);
                          }
                        } else {
                          if (ShopTabViewModel.get(context).count != 0) {
                            await ShopTabViewModel.get(context)
                                .addToCart(product.id!);
                            CartDetailsViewModel.get(context)
                                .updateItemQuantity(product.id!,
                                    ShopTabViewModel.get(context).count);
                          }
                        }
                      },
                      icon: ImageIcon(AssetImage(IconAssets.addToCart)))
                ],
              ),
            ),
          );
        });
  }
}
