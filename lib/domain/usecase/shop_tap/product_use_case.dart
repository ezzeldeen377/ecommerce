import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/shop_tap/shop_tap_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductUseCase{
  ShopTapRepository repository;
  ProductUseCase({required this.repository});
  Future<Either<Failures,ProductResponseEntity>> invoke(){
    return repository.getAllProducts();
  }
}