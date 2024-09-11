import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/features/home_screen/cart_details/cubit/cart_details_view_model.dart';
import 'package:ecommerce/features/home_screen/cart_details/cubit/cart_states.dart';
import 'package:ecommerce/features/home_screen/shop_tap/cubit/shop_tap_states.dart';
import 'package:ecommerce/features/home_screen/shop_tap/cubit/shop_tap_view_model.dart';
import 'package:ecommerce/features/home_screen/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CartDetailsViewModel,CartStates>(
      bloc: CartDetailsViewModel.get(context)..getCarDetails(),
      builder: (context,state) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          title:Text( ConstantManager.cart,style:
          getMediumStyle(color: AppColors.blackColor,size: FontSize.s20.sp),),
          centerTitle: true,

          actions: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: AppPadding.p10.w),
              child: ImageIcon(AssetImage(IconAssets.search),color: AppColors.primaryColor,),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: AppPadding.p10.w),
              child: ImageIcon(AssetImage(IconAssets.cart),color: AppColors.primaryColor,),
            ),
          ],
        ),
          body: CartDetailsViewModel.get(context).productList!=null? ListView.builder(
            itemCount: CartDetailsViewModel.get(context).productList!.length,
              itemBuilder:(context,index){
                return  CartItem(product: CartDetailsViewModel.get(context).productList![index],);
              }
          ):
          Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),

          bottomNavigationBar:CartDetailsViewModel.get(context).cart!=null? BottomAppBar(
          color: AppColors.whiteColor,
          height: 102.h,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(ConstantManager.totalItemPrice,
                    style: getMediumStyle(color: AppColors.blackColor.withOpacity(.8),size: FontSize.s18.sp),),
                  Text('EGP ${CartDetailsViewModel.get(context).cart!.data!.totalCartPrice
                  }',style: getMediumStyle(color: AppColors.blackColor,size: FontSize.s18.sp),)
                ],
              ),
              ElevatedButton.icon(
                  style:ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.whiteColor
                  ),
                  label: Text(ConstantManager.checkOut),
                  onPressed: (){}, icon: ImageIcon(AssetImage(IconAssets.addToCart)))
            ],
          ),
        ):
          Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),

        );
      }
    );
  }
}
