import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/CartDetailsResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/cart_details/cart_details_data_source.dart';
import 'package:ecommerce/domain/repository/cart_details/cart_details_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CartDetailsRepository)
class CartDetailsRepositoryImpl implements CartDetailsRepository{
  CartDetailsDataSource dataSource;
  CartDetailsRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failures, CartDetailsResponseEntity>> getAllCart() async {
    // TODO: implement getAllCart
    var either =await  dataSource.getAllCart();
    return either.fold((error)=>Left(error),(response)=>Right(response));
  }

  @override
  Future<Either<Failures, CartDetailsResponseEntity>> deleteItemFromCart(String productId) async {
    // TODO: implement getAllCart
    var either =await  dataSource.deleteItemFromCart(productId);
    return either.fold((error)=>Left(error),(response)=>Right(response));
  }

  @override
  Future<Either<Failures, CartDetailsResponseEntity>> updateItemQuantity(String productId,double count) async{
    // TODO: implement getAllCart
    var either =await  dataSource.updateItemQuantity(productId,count);
    return either.fold((error)=>Left(error),(response)=>Right(response));
  }

}