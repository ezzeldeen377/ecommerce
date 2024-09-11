import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/CartDetailsResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';

abstract class CartDetailsDataSource{
  Future<Either<Failures,CartDetailsResponseEntity>> getAllCart();
  Future<Either<Failures,CartDetailsResponseEntity>> deleteItemFromCart(String productId);
  Future<Either<Failures,CartDetailsResponseEntity>>updateItemQuantity(String productId,double count);

}
