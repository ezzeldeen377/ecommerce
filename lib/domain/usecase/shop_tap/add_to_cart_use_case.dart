import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/AddToCartResponse.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/shop_tap/shop_tap_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class AddToCartUseCase{
  ShopTapRepository repository;
  AddToCartUseCase({required this.repository});
  Future<Either<Failures,AddToCartResponseEntity>>invoke(String productId){
    return repository.addToCart(productId);
  }

}