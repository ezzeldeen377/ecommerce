import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/CartDetailsResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/cart_details/cart_details_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartDetailsUseCase {
  CartDetailsRepository repository;
  GetCartDetailsUseCase({required this.repository});
  Future<Either<Failures, CartDetailsResponseEntity>> invoke() {
    return repository.getAllCart();
  }
}
