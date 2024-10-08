import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/AddToWatchListResponse.dart';
import 'package:ecommerce/domain/entities/GetwishlistResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';

abstract class FavouriteTabDataSource {
  Future<Either<Failures, AddToWatchListResponseEntity>> addToWatchList(
      String productId);
  Future<Either<Failures, GetWishlistResponseEntity>> getAllWishList();
}
