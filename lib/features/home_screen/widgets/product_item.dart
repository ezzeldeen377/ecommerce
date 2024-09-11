import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce/features/home_screen/shop_tap/cubit/shop_tap_view_model.dart';
import 'package:ecommerce/features/home_screen/widgets/favourite_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  ProductEntity product;
  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child:Column(
            children: [
              CachedNetworkImage(
                imageUrl:product.imageCover??"",
                imageBuilder: (context, imageProvider) => Container(
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(height:100.h,child: Center(child: CircularProgressIndicator())),
                errorWidget: (context, url, error) => Container(height:100.h,child: Center(child: Icon(Icons.error))),
              ),
              Padding(
                padding:  EdgeInsets.all(5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title??'',style: getSemiBoldStyle(color: AppColors.blackColor,size: FontSize.s14),
                    overflow: TextOverflow.ellipsis,maxLines: 1,),
                    Text(product.description??'',style: getSemiBoldStyle(color: AppColors.blackColor,size: FontSize.s12),
                      overflow: TextOverflow.ellipsis,maxLines: 2,),
                    Row(
                      children: [
                        Text('EGP${product.price.toString()}',style: getSemiBoldStyle(color: AppColors.blackColor,size: FontSize.s14),),
                        SizedBox(width: 10.w,),
                        Text(' ${getActualPrice(product.price!.toInt()).toString()}EGP',
                          style: getSemiBoldStyle(color: AppColors.primaryColor,size: FontSize.s12,decoration: TextDecoration.lineThrough),),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('review(${product.ratingsAverage.toString()})',
                              style: getSemiBoldStyle(color: AppColors.blackColor,size: FontSize.s14),),
                            Icon(Icons.star,size: 15,color: AppColors.yellowColor,)
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            ShopTabViewModel.get(context).addToCart(product.id!);
                          },
                          child:  CircleAvatar(
                              backgroundColor: AppColors.primaryColor,
                              radius: 20.w,
                              child: Icon(Icons.add,color: AppColors.whiteColor,weight: 25,)),
                        ),
                      ],
                    )
                  ],
                ),
              ),



            ],
          ),
        ),
        FavouriteLabel(),
      ],
    ) ;
  }
  int getActualPrice(int num){
    int price=(num~/4)+num;
    return price;
  }
}
