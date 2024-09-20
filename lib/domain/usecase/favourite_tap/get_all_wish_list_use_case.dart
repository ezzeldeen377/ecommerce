import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/GetwishlistResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/favourite_tap/favourite_tab_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllWishListUseCase {
  FavouriteTabRepository repository;
  GetAllWishListUseCase({required this.repository});
  Future<Either<Failures, GetWishlistResponseEntity>> invoke() {
    return repository.getAllWishList();
  }
}
