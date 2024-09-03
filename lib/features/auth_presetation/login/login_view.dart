import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes_manager/routes.dart';
import 'package:ecommerce/core/widgets/alert_utils.dart';
import 'package:ecommerce/core/widgets/elevated_button_widget.dart';
import 'package:ecommerce/core/widgets/text_form_field_widget.dart';
import 'package:ecommerce/domain/di/di.dart';
import 'package:ecommerce/features/auth_presetation/login/cubit/login_states.dart';
import 'package:ecommerce/features/auth_presetation/login/cubit/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  LoginViewModel viewModel = getIt<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Alert.hideLoading(context: context);
          Alert.showAlert(
              context: context,
              content: ConstantManager.saveLogin,
              title: state.response.statusMsg ?? ConstantManager.loginSuccess,
              firstbutton: ConstantManager.ok,
              secondbutton: ConstantManager.notNow);
        } else if (state is LoginErrorState) {
          Alert.hideLoading(context: context);
          Alert.showAlert(
            context: context,
            content: state.errorMessage,
            title: ConstantManager.failed,
            firstbutton: ConstantManager.back,
          );
        } else if (state is LoginLoadingState) {
          Alert.showLoading(context: context, message: ConstantManager.loading);
        }
      },
      child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
                color: AppColors.primaryColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 90.h,
                      ),
                      Image.asset(ImageAssets.logo),
                      SizedBox(
                        height: AppPadding.p40.h,
                      ),
                      Text(
                        ConstantManager.welcomeMessage,
                        style: getMediumStyle(
                            color: AppColors.whiteColor, size: FontSize.s22),
                      ),
                      Text(
                        ConstantManager.askForSignIn,
                        style: getLightStyle(
                            color: AppColors.whiteColor, size: FontSize.s14),
                      ),
                      SizedBox(
                        height: AppPadding.p20.h,
                      ),
                      Form(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            ConstantManager.email,
                            style: getRegularStyle(
                                color: AppColors.whiteColor,
                                size: FontSize.s16),
                          ),
                          const SizedBox(
                            height: AppPadding.p8,
                          ),
                          TextFormFieldWidget(
                            hint: ConstantManager.emailLabel,
                            controller: viewModel.emailController,
                          ),
                          const SizedBox(
                            height: AppPadding.p10,
                          ),
                          Text(
                            ConstantManager.password,
                            style: getRegularStyle(
                                color: AppColors.whiteColor,
                                size: FontSize.s16),
                          ),
                          const SizedBox(
                            height: AppPadding.p8,
                          ),
                          TextFormFieldWidget(
                            hint: ConstantManager.passwordLabel,
                            obscureText: true,
                            controller: viewModel.passwordController,
                            suffixIcon:
                                const ImageIcon(AssetImage((IconAssets.view))),
                            show: true,
                            SuffixIconShowed:
                                const ImageIcon(AssetImage((IconAssets.hide))),
                          ),
                          const SizedBox(
                            height: AppPadding.p10,
                          ),
                          Text(
                            ConstantManager.forgetPassword,
                            style: getRegularStyle(
                                color: AppColors.whiteColor,
                                size: FontSize.s16),
                            textAlign: TextAlign.end,
                          ),
                          const SizedBox(
                            height: AppPadding.p22,
                          ),
                          ElevatedButtonWidget(
                            text: ConstantManager.login,
                            onPressed: () {
                              // viewModel.login();
                              Navigator.of(context)
                                  .pushNamed(Routes.homeScreen);
                            },
                          ),
                          const SizedBox(
                            height: AppPadding.p10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ConstantManager.dontHaveAccount,
                                style: getRegularStyle(
                                    color: AppColors.whiteColor,
                                    size: FontSize.s16),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(Routes.signUp);
                                },
                                child: Text(
                                  ConstantManager.createAccount,
                                  style: getRegularStyle(
                                      color: AppColors.whiteColor,
                                      size: FontSize.s16),
                                ),
                              )
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                )),
          )),
    );
  }
}
