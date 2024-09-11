import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/CartDetailsResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/cart_details/cart_details_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class UpdateQuantityUseCase{
  CartDetailsRepository repository;
  UpdateQuantityUseCase({required this.repository});

  Future<Either<Failures, CartDetailsResponseEntity>> invoke(String productId,double count){
    return repository.updateItemQuantity(productId, count);
  }
}