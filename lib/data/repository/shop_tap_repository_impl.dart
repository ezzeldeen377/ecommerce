import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/data_source/shop_tap_data_source_impl.dart';
import 'package:ecommerce/domain/entities/AddToCartResponse.dart';
import 'package:ecommerce/domain/entities/CartDetailsResponseEntity.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/shop_tap/shop_tap_data_source.dart';
import 'package:ecommerce/domain/repository/shop_tap/shop_tap_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ShopTapRepository)
class ShopTabRepositoryImpl implements ShopTapRepository{
  ShopTapDataSource dataSource;
  ShopTabRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async {
    var either =await dataSource.getAllProducts();
    return either.fold((error)=>Left(error),(response)=>Right(response));
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId) async {
    // TODO: implement addToCart
    var either =await dataSource.addToCart(productId);
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }


}