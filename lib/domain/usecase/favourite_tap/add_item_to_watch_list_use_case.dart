import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/AddToWatchListResponse.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/favourite_tap/favourite_tab_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddItemToWatchListUseCase {
  FavouriteTabRepository repository;
  AddItemToWatchListUseCase({required this.repository});

  Future<Either<Failures, AddToWatchListResponseEntity>> invoke(
      String productId) {
    return repository.addToWatchList(productId);
  }
}
