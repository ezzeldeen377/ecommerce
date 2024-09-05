import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/features/home_screen/cubit/home_screen_states.dart';
import 'package:ecommerce/features/home_screen/cubit/home_screen_view_model.dart';
import 'package:ecommerce/features/home_screen/favourite_tap/favourite_tap_view.dart';
import 'package:ecommerce/features/home_screen/home_tap/home_tap_view.dart';
import 'package:ecommerce/features/home_screen/personal_tap/personal_tap_view.dart';
import 'package:ecommerce/features/home_screen/shop_tap/shop_tap_view.dart';
import 'package:ecommerce/features/home_screen/widgets/bottom_navigation_bar_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenView extends StatefulWidget {
  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel,HomeScreenStates>(
      bloc:  HomeScreenViewModel.getInit(context),
      builder: (context,state) {
        return Scaffold(
          extendBody: true,
          body: HomeScreenViewModel.getInit(context).tabs[HomeScreenViewModel.getInit(context).selectedIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15), topRight: Radius.circular(15))),
              child: BottomNavigationBar(
                  currentIndex: HomeScreenViewModel.getInit(context).selectedIndex,
                  onTap: (index) {
                    HomeScreenViewModel.getInit(context).changeIndex(index);
                  },
                  unselectedItemColor: AppColors.whiteColor,
                  backgroundColor: AppColors.redColor,
                  showSelectedLabels: false,
                  items: [
                    BottomNavigationBarItemWidget.getBottomNavigationBarItemWidget(
                        IconAssets.home, ConstantManager.home),
                    BottomNavigationBarItemWidget.getBottomNavigationBarItemWidget(
                        IconAssets.shop, ConstantManager.shop),
                    BottomNavigationBarItemWidget.getBottomNavigationBarItemWidget(
                        IconAssets.favourite, ConstantManager.favourite),
                    BottomNavigationBarItemWidget.getBottomNavigationBarItemWidget(
                        IconAssets.personal, ConstantManager.personal),
                  ]),
            ),
          ),
        );
      }
    );
  }
}
