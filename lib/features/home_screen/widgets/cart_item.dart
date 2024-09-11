import 'package:cached_network_image/cached_network_image.dart';
import 'package:customizable_counter/customizable_counter.dart';
import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:ecommerce/domain/entities/CartDetailsResponseEntity.dart';
import 'package:ecommerce/features/home_screen/cart_details/cubit/cart_details_view_model.dart';
import 'package:ecommerce/features/home_screen/shop_tap/cubit/shop_tap_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
   CartItem({required  this.product});
  CartProductsEntity product;
  @override
  Widget build(BuildContext context) {
    print('##########${product.product!.id}');
    return Container(
      margin:EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.primaryColor
        ),
        borderRadius: BorderRadius.circular(15.h),

      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.h),
            child: CachedNetworkImage(
              imageUrl: product.product!.imageCover??"",
              width:150.w,
              height: 150.h,
              fit:BoxFit.fill,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Column(
            children:[
              SizedBox(
                width: 250.w,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(product.product!.title??'',
                        style: getMediumStyle(color: AppColors.blackColor,size: FontSize.s18.sp),overflow: TextOverflow.ellipsis,),
                    ),
                    IconButton(onPressed: (){
                      CartDetailsViewModel.get(context).deleteItemFromCart(product.product!.id??'',context);
                    },
                        icon:ImageIcon(AssetImage(IconAssets.delete)))

                  ],
                ),
              ),
              SizedBox(
                width: 250.w,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('EGP ${product.price}',style: getMediumStyle(color: AppColors.blackColor,
                        size: FontSize.s18.sp),),
                    CustomizableCounter(
                      borderRadius: 50,
                      borderWidth: 0,
                      buttonText: ConstantManager.addToCart,
                      backgroundColor: AppColors.primaryColor,
                      textColor: Colors.white,
                      textSize: FontSize.s16.sp,
                      count:product.count!.toDouble(),
                      step: 1,
                      minCount: 0,
                      maxCount: product.product!.quantity!=null?product.product!.quantity!.toDouble():300,
                      incrementIcon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                      decrementIcon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.white,
                      ),
                      onCountChange: (count) {
                      },
                      onIncrement: (count) {
                        CartDetailsViewModel.get(context).updateItemQuantity(product.product!.id??'', count);

                      },
                      onDecrement: (count) {
                        CartDetailsViewModel.get(context).updateItemQuantity(product.product!.id??'', count);

                      },
                    ),

                  ],
                ),
              ),


            ]
          )
        ],
      ),
    );
  }
}
