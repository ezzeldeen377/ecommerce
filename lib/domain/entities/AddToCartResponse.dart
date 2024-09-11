/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "66dc86801a43872c9195bbe9"
/// data : {"_id":"66dc86801a43872c9195bbe9","cartOwner":"66d5b4ec9f2845fbe68325dd","products":[{"count":1,"_id":"66dc86801a43872c9195bbea","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2024-09-07T16:59:44.714Z","updatedAt":"2024-09-07T16:59:45.090Z","__v":0,"totalCartPrice":149}

class AddToCartResponseEntity {
  AddToCartResponseEntity({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});

  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  CartDataEntity? data;


}

/// _id : "66dc86801a43872c9195bbe9"
/// cartOwner : "66d5b4ec9f2845fbe68325dd"
/// products : [{"count":1,"_id":"66dc86801a43872c9195bbea","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2024-09-07T16:59:44.714Z"
/// updatedAt : "2024-09-07T16:59:45.090Z"
/// __v : 0
/// totalCartPrice : 149

class CartDataEntity {
  CartDataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  String? id;
  String? cartOwner;
  List<ProductsInCartEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  toJson() {}


}

/// count : 1
/// _id : "66dc86801a43872c9195bbea"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class ProductsInCartEntity {
  ProductsInCartEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  num? count;
  String? id;
  String? product;
  num? price;

  toJson() {}


}