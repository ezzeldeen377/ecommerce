import 'package:ecommerce/domain/entities/AddToCartResponse.dart';
import 'package:ecommerce/domain/entities/CartDetailsResponseEntity.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';

abstract class ShopTapStates {}

class ShopTapInitialState extends ShopTapStates {}

class ShopTapLoadingState extends ShopTapStates {}

class ShopTapErrorState extends ShopTapStates {
  String errorMessage;
  ShopTapErrorState({required this.errorMessage});
}

class ShopTapSuccessState extends ShopTapStates {
  ProductResponseEntity product;
  ShopTapSuccessState({required this.product});
}

class ShopTapChangeTotalPriceState extends ShopTapStates {}

class AddToCartLoadingState extends ShopTapStates {}

class AddToCartErrorState extends ShopTapStates {
  String errorMessage;
  AddToCartErrorState({required this.errorMessage});
}

class AddToCartSuccessState extends ShopTapStates {
  AddToCartResponseEntity cart;
  AddToCartSuccessState({required this.cart});
}
