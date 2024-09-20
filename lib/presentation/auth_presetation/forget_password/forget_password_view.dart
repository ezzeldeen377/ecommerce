import 'dart:async';

import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes_manager/routes.dart';
import 'package:ecommerce/core/widgets/alert_utils.dart';
import 'package:ecommerce/core/widgets/elevated_button_widget.dart';
import 'package:ecommerce/core/widgets/snake_bar_utiles.dart';
import 'package:ecommerce/core/widgets/text_form_field_widget.dart';
import 'package:ecommerce/domain/di/di.dart';
import 'package:ecommerce/presentation/auth_presetation/forget_password/cubit/forget_password_states.dart';
import 'package:ecommerce/presentation/auth_presetation/forget_password/cubit/forget_password_view_model.dart';
import 'package:ecommerce/presentation/auth_presetation/login/cubit/login_states.dart';
import 'package:ecommerce/presentation/auth_presetation/login/cubit/login_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordViewModel, ForgetPasswordStates>(
        bloc: ForgetPasswordViewModel.get(context),
        listener: (context, state) {
          if (state is ForgetPasswordSendedEmailState) {
            SnakeBarUtiles.showMySnakeBar(context, state.response.message!);
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pushNamed(Routes.verifyResetPassword);
            });
          } else if (state is ForgetPasswordErrorState) {
            print('sfsdfsd');
            SnakeBarUtiles.showMySnakeBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: AppColors.primaryColor,
              resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
                child: Container(
                    color: AppColors.primaryColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppPadding.p16.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150.h,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.h),
                                  border: Border.all(
                                      color: AppColors.whiteColor, width: 1)),
                              padding: EdgeInsets.all(AppPadding.p16.h),
                              child: Icon(
                                Icons.fingerprint,
                                color: AppColors.whiteColor,
                              )),
                          SizedBox(
                            height: AppPadding.p40.h,
                          ),
                          Text(
                            ConstantManager.forgetPassword,
                            style: getMediumStyle(
                                color: AppColors.whiteColor,
                                size: FontSize.s22),
                          ),
                          Text(
                            ConstantManager.noWorries,
                            style: getLightStyle(
                                color: AppColors.whiteColor,
                                size: FontSize.s14),
                          ),
                          SizedBox(
                            height: AppPadding.p20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.h),
                            child: state is ForgetPasswordLoadingState
                                ? CircularProgressIndicator(
                                    color: AppColors.whiteColor,
                                  )
                                : SizedBox.shrink(),
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
                                controller: ForgetPasswordViewModel.get(context)
                                    .emailController,
                              ),
                              const SizedBox(
                                height: AppPadding.p10,
                              ),
                              ElevatedButtonWidget(
                                  text: ConstantManager.resetPassword,
                                  onPressed:
                                      ForgetPasswordViewModel.get(context)
                                          .forgetPassword),
                              SizedBox(
                                height: AppPadding.p12.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(Routes.login);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_back,
                                      size: AppPadding.p16.w,
                                      color: AppColors.whiteColor,
                                    ),
                                    Text(
                                      ConstantManager.backToLogin,
                                      style: getRegularStyle(
                                          color: AppColors.whiteColor,
                                          size: FontSize.s16.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    )),
              ));
        });
  }
}
