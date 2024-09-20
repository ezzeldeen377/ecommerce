import 'package:ecommerce/domain/entities/AddToWatchListResponse.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';

abstract class FavouriteTabStates {}

class FavouriteTabLoadingState extends FavouriteTabStates {}

class FavouriteTabErrorState extends FavouriteTabStates {
  String errorMessage;
  FavouriteTabErrorState({required this.errorMessage});
}

class FavouriteTabSuccessState extends FavouriteTabStates {
  List<ProductEntity> wishList;
  FavouriteTabSuccessState({required this.wishList});
}
