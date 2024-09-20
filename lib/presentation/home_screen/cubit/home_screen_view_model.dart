import 'package:ecommerce/domain/di/di.dart';
import 'package:ecommerce/presentation/home_screen/cart_details/cubit/cart_details_view_model.dart';
import 'package:ecommerce/presentation/home_screen/cubit/home_screen_states.dart';
import 'package:ecommerce/presentation/home_screen/favourite_tap/favourite_tap_view.dart';
import 'package:ecommerce/presentation/home_screen/home_tap/home_tap_view.dart';
import 'package:ecommerce/presentation/home_screen/personal_tap/personal_tap_view.dart';
import 'package:ecommerce/presentation/home_screen/shop_tap/cubit/shop_tap_view_model.dart';
import 'package:ecommerce/presentation/home_screen/shop_tap/shop_tap_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeScreenInitialState());
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTapView(),
    ShopTapView(),
    FavouriteTapView(),
    PersonalTapView()
  ];
  static HomeScreenViewModel getInit(BuildContext context) =>
      BlocProvider.of<HomeScreenViewModel>(context);

  void changeIndex(int newIndex) {
    selectedIndex = newIndex;
    emit(HomeScreenIndexChangedState());
  }

  void init(BuildContext context) async {
    await CartDetailsViewModel.get(context).getCarDetails();
    ShopTabViewModel.get(context).changeNumOfCartItems(
        CartDetailsViewModel.get(context).cart!.numOfCartItems!.toInt());
  }
}
