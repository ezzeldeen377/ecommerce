import 'package:ecommerce/domain/entities/CartDetailsResponseEntity.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';

class GetWishlistResponseEntity {
  String? status;
  int? count;
  List<ProductEntity>? data;

  GetWishlistResponseEntity({
    this.status,
    this.count,
    this.data,
  });
}
