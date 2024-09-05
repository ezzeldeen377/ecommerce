import 'package:ecommerce/core/routes_manager/route_generator.dart';
import 'package:ecommerce/core/routes_manager/routes.dart';
import 'package:ecommerce/domain/di/di.dart';
import 'package:ecommerce/features/home_screen/cubit/home_screen_view_model.dart';
import 'package:ecommerce/features/home_screen/home_tap/cubit/home_tap_view_model.dart';
import 'package:ecommerce/myObserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(providers:[
      BlocProvider<HomeTapViewModel>(create: (_)=>getIt<HomeTapViewModel>()),
      BlocProvider<HomeScreenViewModel>(create: (_)=>getIt<HomeScreenViewModel>()),
    ],
    child:MyApp()),
  );
}

class MyApp extends StatelessWidget {
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
            initialRoute: Routes.homeScreen,
            onGenerateRoute: RouteGenerator.onGenerate,
          );
        });
  }
}
