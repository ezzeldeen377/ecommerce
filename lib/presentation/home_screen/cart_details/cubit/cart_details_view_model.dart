import 'package:ecommerce/domain/entities/AddToCartResponse.dart';
import 'package:ecommerce/domain/entities/CartDetailsResponseEntity.dart';
import 'package:ecommerce/domain/usecase/shop_tap/delete_item_from_cart_use_case.dart';
import 'package:ecommerce/domain/usecase/shop_tap/get_cart_details_use_case.dart';
import 'package:ecommerce/domain/usecase/shop_tap/update_quantity_use_case.dart';
import 'package:ecommerce/presentation/home_screen/cart_details/cubit/cart_states.dart';
import 'package:ecommerce/presentation/home_screen/shop_tap/cubit/shop_tap_states.dart';
import 'package:ecommerce/presentation/home_screen/shop_tap/cubit/shop_tap_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartDetailsViewModel extends Cubit<CartStates> {
  CartDetailsViewModel(
      {required this.cartDetailsUseCase,
      required this.deleteItemFromCartUseCase,
      required this.updateQuantityUseCase})
      : super(CartDetailsInitialState());
  GetCartDetailsUseCase cartDetailsUseCase;
  DeleteItemFromCartUseCase deleteItemFromCartUseCase;
  UpdateQuantityUseCase updateQuantityUseCase;

  bool? checkItemInCart(String productId) {
    var check = productList?.any((element) {
      return element.product?.id == productId;
    });
    print(check);
    return check;
  }

  static CartDetailsViewModel get(BuildContext context) =>
      BlocProvider.of<CartDetailsViewModel>(context);

  List<CartProductsEntity>? productList;

  CartDetailsResponseEntity? cart;

  Future<void> getCarDetails() async {
    emit(CartDetailsLoadingState());
    var either = await cartDetailsUseCase.invoke();
    either.fold((error) {
      print(error.errorMessage);
      emit(CartDetailsErrorState(errorMessage: error.errorMessage));
    }, (response) {
      productList = response.data!.products;
      cart = response;
      emit(CartDetailsSuccessState(cart: response));
    });
  }

  double getCount(String productId) {
    double count = 0;
    var list = productList!.where(
      (element) {
        return element.product!.id == productId;
      },
    ).toList();

    return list.isNotEmpty ? list[0].count!.toDouble() : 0;
  }

  Future<void> deleteItemFromCart(
      String productId, BuildContext context) async {
    var either = await deleteItemFromCartUseCase.invoke(productId);
    either.fold((error) {
      emit(CartDetailsErrorState(errorMessage: error.errorMessage));
    }, (response) {
      productList = response.data!.products;
      cart = response;
      ShopTabViewModel.get(context)
          .changeNumOfCartItems(response.numOfCartItems!.toInt());
      print(cart!.numOfCartItems);
      emit(CartDetailsSuccessState(cart: response));
    });
  }

  Future<void> updateItemQuantity(String productId, double count) async {
    var either = await updateQuantityUseCase.invoke(productId, count);
    either.fold((error) {
      emit(CartDetailsErrorState(errorMessage: error.errorMessage));
    }, (response) {
      productList = response.data!.products;
      cart = response;
      print(cart!.numOfCartItems);
      emit(CartDetailsSuccessState(cart: response));
    });
  }
}
