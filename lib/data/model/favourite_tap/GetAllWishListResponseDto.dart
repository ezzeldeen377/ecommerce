import 'package:ecommerce/data/model/shop_tap/ProductResponseDto.dart';
import 'package:ecommerce/domain/entities/GetwishlistResponseEntity.dart';

class GetAllWishListResponseDto extends GetWishlistResponseEntity {
  String? message;
  GetAllWishListResponseDto(
      {super.status, super.count, super.data, this.message});

  GetAllWishListResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = <ProductDto>[];
      json['data'].forEach((v) {
        data!.add(new ProductDto.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
