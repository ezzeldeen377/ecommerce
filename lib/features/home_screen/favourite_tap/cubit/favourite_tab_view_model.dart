import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce/domain/usecase/favourite_tap/add_item_to_watch_list_use_case.dart';
import 'package:ecommerce/features/home_screen/favourite_tap/cubit/favourite_tab_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class FavouriteTabViewModel extends Cubit<FavouriteTabStates>{
  FavouriteTabViewModel({required this.addItemToWatchListUseCase}):super(FavouriteTabLoadingState());

  AddItemToWatchListUseCase addItemToWatchListUseCase;

  List<ProductEntity>? wishList;

  static FavouriteTabViewModel get(BuildContext context)=>BlocProvider.of<FavouriteTabViewModel>(context);
  Future<void> addItemToWishList(String productId) async {
    var response= await addItemToWatchListUseCase.invoke(productId);
    response.fold((error){
      emit(FavouriteTabErrorState(errorMessage: error.errorMessage));
    }, (response){
      wishList=response.data;
      emit(FavouriteTabSuccessState(wishList: response));
    });

  }
}