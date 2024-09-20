import 'package:ecommerce/domain/entities/CartDetailsResponseEntity.dart';

abstract class CartStates {}

class CartDetailsInitialState extends CartStates {}

class CartDetailsLoadingState extends CartStates {}

class CartDetailsErrorState extends CartStates {
  String errorMessage;
  CartDetailsErrorState({required this.errorMessage});
}

class CartDetailsSuccessState extends CartStates {
  CartDetailsResponseEntity cart;

  CartDetailsSuccessState({required this.cart});
}
