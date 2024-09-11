import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/CartDetailsResponseEntity.dart';
import 'package:ecommerce/domain/repository/cart_details/cart_details_repository.dart';
import 'package:injectable/injectable.dart';

import '../../failures.dart';
@injectable
class DeleteItemFromCartUseCase{
  CartDetailsRepository repository;
  DeleteItemFromCartUseCase({required this.repository});

  Future<Either<Failures, CartDetailsResponseEntity>> invoke(String productId){
    return repository.deleteItemFromCart(productId);
  }
}