import 'package:ecommerce/data/model/shop_tap/ProductResponseDto.dart';
import 'package:ecommerce/domain/entities/AddToWatchListResponse.dart';

/// status : "success"
/// count : 1
/// data : [{"sold":7638,"images":["1680403397482-1.jpeg","1680403397482-2.jpeg","1680403397483-3.jpeg","1680403397485-4.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":18,"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","slug":"woman-shawl","description":"Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen","quantity":225,"price":170,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"createdAt":"2023-04-02T02:43:18.400Z","updatedAt":"2024-09-11T05:34:29.010Z","__v":0,"id":"6428ebc6dc1175abc65ca0b9"}]

class AddToWatchListResponseDto extends AddToWatchListResponseEntity {
  AddToWatchListResponseDto(
      {super.status, super.count, super.data, this.message, this.statusMsg});

  AddToWatchListResponseDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDto.fromJson(v));
      });
    }
  }
  String? statusMsg;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    map['count'] = count;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// sold : 7638
/// images : ["1680403397482-1.jpeg","1680403397482-2.jpeg","1680403397483-3.jpeg","1680403397485-4.jpeg"]
/// subcategory : [{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}]
/// ratingsQuantity : 18
/// _id : "6428ebc6dc1175abc65ca0b9"
/// title : "Woman Shawl"
/// slug : "woman-shawl"
/// description : "Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen"
/// quantity : 225
/// price : 170
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg"
/// category : {"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"}
/// brand : {"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"}
/// ratingsAverage : 4.8
/// createdAt : "2023-04-02T02:43:18.400Z"
/// updatedAt : "2024-09-11T05:34:29.010Z"
/// __v : 0
/// id : "6428ebc6dc1175abc65ca0b9"
