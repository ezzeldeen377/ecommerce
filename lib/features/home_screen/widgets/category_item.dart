import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/domain/entities/CategoryResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  DataEntity categoryData;
  CategoryItem({required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CachedNetworkImage(

            imageUrl:categoryData.image??"",
            imageBuilder: (context, imageProvider) => Container(
              width: 100.h,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    ),
              ),
            ),
            placeholder: (context, url) => Container(height:100.h,child: Center(child: CircularProgressIndicator())),
            errorWidget: (context, url, error) => Container(height:100.h,child: Center(child: Icon(Icons.error))),
          ),
          Text(categoryData.name??'',overflow:TextOverflow.ellipsis,),
        ],
      ),
    );
  }
}
