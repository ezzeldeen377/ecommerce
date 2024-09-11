import 'package:ecommerce/domain/entities/AddToCartResponse.dart';
import 'package:ecommerce/domain/entities/CartDetailsResponseEntity.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce/domain/usecase/shop_tap/add_to_cart_use_case.dart';
import 'package:ecommerce/domain/usecase/shop_tap/get_cart_details_use_case.dart';
import 'package:ecommerce/domain/usecase/shop_tap/product_use_case.dart';
import 'package:ecommerce/features/home_screen/shop_tap/cubit/shop_tap_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ShopTabViewModel extends Cubit<ShopTapStates>{
  ShopTabViewModel({required this.productUseCase,required this.addToCartUseCase}):super(ShopTapInitialState());
  ProductUseCase productUseCase;
  AddToCartUseCase addToCartUseCase;

  AddToCartResponseEntity? addToCartResponse;

  List<ProductEntity> productList=[];

  List<String> sizeList=['38','39','40','41','42','43','44'];
  String? selectedSize;
  void changeSize(String newSize){
    selectedSize=newSize;
    emit(ShopTapChangeTotalPriceState());
  }


  Map<String,Color> colorMap={
    'black':Colors.black,
    'brown':Colors.brown,
    'blue':Colors.blue,
    'green':Colors.green,
    'pink':Colors.pink,
  };
  String? selectedColor;
  void changeColor(String newColor){
    selectedColor=newColor;
    emit(ShopTapChangeTotalPriceState());
  }

  int numOfCartItems=0;
  void changeNumOfCartItems(int newNumber){
    numOfCartItems=newNumber;
  }

  int totalPrice=0;
  void updateTotalPrice(int price){
    totalPrice=price;
    emit(ShopTapChangeTotalPriceState());
  }

  static ShopTabViewModel get(BuildContext context)=>BlocProvider.of<ShopTabViewModel>(context);


    Future<void> getAllProducts() async {
      emit(ShopTapLoadingState());
      var either =await productUseCase.repository.getAllProducts();
      either.fold((error){
        emit(ShopTapErrorState(errorMessage: error.errorMessage));
      },
          (response){
        productList=response.data!;
        emit(ShopTapSuccessState(product: response));
          }
      );

    }


    Future<void> addToCart(String productId) async {
      var either =await addToCartUseCase.invoke(productId);

      either.fold((error){
         emit(AddToCartErrorState(errorMessage: error.errorMessage));
      }, (response){
        addToCartResponse=response;
        numOfCartItems=response.numOfCartItems!.toInt();
        emit(AddToCartSuccessState(cart: response));
      });

    }


  double count=0;
  void changeCount(double newCount){
    count=newCount;
  }


}