import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/AddToCartResponse.dart';
import 'package:ecommerce/domain/entities/CartDetailsResponseEntity.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';

abstract class ShopTapDataSource {
  Future<Either<Failures, ProductResponseEntity>> getAllProducts();
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);
}
