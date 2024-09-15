import 'package:ecommerce/domain/entities/AddToWatchListResponse.dart';

abstract class FavouriteTabStates{}
class FavouriteTabLoadingState extends FavouriteTabStates{}
class FavouriteTabErrorState extends FavouriteTabStates{
  String errorMessage;
  FavouriteTabErrorState({required this.errorMessage});
}
class FavouriteTabSuccessState extends FavouriteTabStates{
  AddToWatchListResponseEntity wishList;
  FavouriteTabSuccessState({required this.wishList});
}