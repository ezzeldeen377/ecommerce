import 'package:ecommerce/domain/di/di.dart';
import 'package:ecommerce/features/home_screen/cubit/home_screen_states.dart';
import 'package:ecommerce/features/home_screen/favourite_tap/favourite_tap_view.dart';
import 'package:ecommerce/features/home_screen/home_tap/home_tap_view.dart';
import 'package:ecommerce/features/home_screen/personal_tap/personal_tap_view.dart';
import 'package:ecommerce/features/home_screen/shop_tap/shop_tap_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeScreenInitialState());
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTapView(),
    const ShopTapView(),
    const FavouriteTapView(),
    const PersonalTapView()
  ];
  static HomeScreenViewModel getInit(BuildContext context)=>BlocProvider.of<HomeScreenViewModel>(context);

  void changeIndex(int newIndex){
      selectedIndex=newIndex;
      emit(HomeScreenIndexChangedState());
  }
}