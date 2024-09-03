import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/widgets/alert_utils.dart';
import 'package:ecommerce/features/home_screen/favourite_tap/favourite_tap_view.dart';
import 'package:ecommerce/features/home_screen/home_tap/home_tap_view.dart';
import 'package:ecommerce/features/home_screen/personal_tap/personal_tap_view.dart';
import 'package:ecommerce/features/home_screen/shop_tap/shop_tap_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenView extends StatefulWidget {
  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  List<Widget> tabs = [
    const HomeTapView(),
    const ShopTapView(),
    const FavouriteTapView(),
    const PersonalTapView()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tabs[selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              unselectedItemColor: AppColors.whiteColor,
              backgroundColor: AppColors.redColor,
              showSelectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    activeIcon: CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      child: ImageIcon(
                        AssetImage("assets/icons/home_icon.png"),
                        color: AppColors.primaryColor,
                      ),
                    ),
                    icon: ImageIcon(AssetImage("assets/icons/home_icon.png")),
                    label: 'home'),
                BottomNavigationBarItem(
                    activeIcon: CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      child: ImageIcon(
                        const AssetImage("assets/icons/shop_icon.png"),
                        color: AppColors.primaryColor,
                      ),
                    ),
                    icon: const ImageIcon(
                        AssetImage("assets/icons/shop_icon.png")),
                    label: 'shop'),
                BottomNavigationBarItem(
                    activeIcon: CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      child: ImageIcon(
                        const AssetImage("assets/icons/favourite_icon.png"),
                        color: AppColors.primaryColor,
                      ),
                    ),
                    icon: const ImageIcon(
                        AssetImage("assets/icons/favourite_icon.png")),
                    label: 'favourite'),
                BottomNavigationBarItem(
                    activeIcon: CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      child: ImageIcon(
                        const AssetImage("assets/icons/personal_icon.png"),
                        color: AppColors.primaryColor,
                      ),
                    ),
                    icon: const ImageIcon(
                        AssetImage("assets/icons/personal_icon.png")),
                    label: 'personal'),
              ]),
        ),
      ),
    );
  }
}
