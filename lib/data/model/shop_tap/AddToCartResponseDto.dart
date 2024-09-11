import 'package:ecommerce/domain/entities/AddToCartResponse.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "66dc86801a43872c9195bbe9"
/// data : {"_id":"66dc86801a43872c9195bbe9","cartOwner":"66d5b4ec9f2845fbe68325dd","products":[{"count":1,"_id":"66dc86801a43872c9195bbea","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2024-09-07T16:59:44.714Z","updatedAt":"2024-09-07T16:59:45.090Z","__v":0,"totalCartPrice":149}

class AddToCartResponseDto extends AddToCartResponseEntity{
  AddToCartResponseDto({
      super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    super.data,});

  AddToCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? CartDataDto.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    map['cartId'] = cartId;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// _id : "66dc86801a43872c9195bbe9"
/// cartOwner : "66d5b4ec9f2845fbe68325dd"
/// products : [{"count":1,"_id":"66dc86801a43872c9195bbea","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2024-09-07T16:59:44.714Z"
/// updatedAt : "2024-09-07T16:59:45.090Z"
/// __v : 0
/// totalCartPrice : 149

class CartDataDto extends CartDataEntity{
  CartDataDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,});

  CartDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductsInCartDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }

}

/// count : 1
/// _id : "66dc86801a43872c9195bbea"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class ProductsInCartDto extends ProductsInCartEntity{
  ProductsInCartDto({
      super.count,
    super.id,
    super.product,
    super.price,});

  ProductsInCartDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }

}