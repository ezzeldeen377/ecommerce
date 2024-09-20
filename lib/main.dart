import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/routes_manager/route_generator.dart';
import 'package:ecommerce/core/routes_manager/routes.dart';
import 'package:ecommerce/core/widgets/shared_preferences_utils.dart';
import 'package:ecommerce/domain/di/di.dart';
import 'package:ecommerce/presentation/auth_presetation/forget_password/cubit/forget_password_view_model.dart';
import 'package:ecommerce/presentation/home_screen/cart_details/cubit/cart_details_view_model.dart';
import 'package:ecommerce/presentation/home_screen/cubit/home_screen_view_model.dart';
import 'package:ecommerce/presentation/home_screen/favourite_tap/cubit/favourite_tab_view_model.dart';
import 'package:ecommerce/presentation/home_screen/home_tap/cubit/home_tap_view_model.dart';
import 'package:ecommerce/presentation/home_screen/shop_tap/cubit/shop_tap_view_model.dart';
import 'package:ecommerce/myObserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesUtils.init();
  var object = SharedPreferencesUtils.get(ConstantManager.keepLogin);
  String route;
  if (object != null) {
    print(object);
    route = Routes.homeScreen;
  } else {
    print(object);
    route = Routes.login;
  }
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider<HomeTapViewModel>(
              create: (_) => getIt<HomeTapViewModel>()),
          BlocProvider<ShopTabViewModel>(
              create: (_) => getIt<ShopTabViewModel>()),
          BlocProvider<HomeScreenViewModel>(
              create: (_) => getIt<HomeScreenViewModel>()),
          BlocProvider<CartDetailsViewModel>(
              create: (_) => getIt<CartDetailsViewModel>()),
          BlocProvider<FavouriteTabViewModel>(
              create: (_) => getIt<FavouriteTabViewModel>()),
          BlocProvider<ForgetPasswordViewModel>(
              create: (_) => getIt<ForgetPasswordViewModel>()),
        ],
        child: MyApp(
          route: route,
        )),
  );
}

class MyApp extends StatelessWidget {
  String route;
  MyApp({required this.route});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: route,
            onGenerateRoute: RouteGenerator.onGenerate,
          );
        });
  }
}
