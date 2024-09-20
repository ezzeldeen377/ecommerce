import 'package:ecommerce/core/routes_manager/routes.dart';
import 'package:ecommerce/presentation/auth_presetation/forget_password/forget_password_view.dart';
import 'package:ecommerce/presentation/auth_presetation/forget_password/reset_password_view.dart';
import 'package:ecommerce/presentation/auth_presetation/forget_password/verify_reset_code_view.dart';
import 'package:ecommerce/presentation/auth_presetation/login/login_view.dart';
import 'package:ecommerce/presentation/auth_presetation/sign_up/sign_up.dart';
import 'package:ecommerce/presentation/home_screen/home_screen_view.dart';
import 'package:ecommerce/presentation/home_screen/shop_tap/product_details_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => Login());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => SignUp());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreenView());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordView());
      case Routes.verifyResetPassword:
        return MaterialPageRoute(builder: (_) => VerifyResetCodeView());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => ResetPasswordView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(" No Route Found"),
        ),
        body: Center(
          child: Text(" No Route Found"),
        ),
      );
    });
  }
}
