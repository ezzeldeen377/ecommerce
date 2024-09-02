import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widgets/alert_utils.dart';
import 'package:ecommerce/core/widgets/elevated_button_widget.dart';
import 'package:ecommerce/core/widgets/text_form_field_widget.dart';
import 'package:ecommerce/domain/di/di.dart';
import 'package:ecommerce/features/auth_presetation/sign_up/cubit/sign_up_states.dart';
import 'package:ecommerce/features/auth_presetation/sign_up/cubit/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignUpViewModel viewModel = getIt<SignUpViewModel>();
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: BlocListener(
          bloc: viewModel,
          listener: (context, state) {
            if (state is SignUpSuccessState) {
              Alert.hideLoading(context: context);
              Alert.showAlert(
                  context: context,
                  content: ConstantManager.saveLogin,
                  title: state.response.statusMsg ??
                      ConstantManager.createdSuccess,
                  firstbutton: ConstantManager.ok,
                  secondbutton: ConstantManager.notNow);
            } else if (state is SignUpErrorState) {
              Alert.hideLoading(context: context);
              Alert.showAlert(
                context: context,
                content: state.errorMassage,
                title: ConstantManager.failed,
                firstbutton: ConstantManager.back,
              );
            } else if (state is SignUpLoadingState) {
              Alert.showLoading(
                  context: context, message: ConstantManager.waiting);
            }
          },
          child: SingleChildScrollView(
            child: Container(
                color: AppColors.primaryColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.h),
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
                          key: viewModel.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                ConstantManager.fullName,
                                style: getRegularStyle(
                                    color: AppColors.whiteColor,
                                    size: FontSize.s16),
                              ),
                              SizedBox(
                                height: AppPadding.p8.h,
                              ),
                              TextFormFieldWidget(
                                hint: ConstantManager.fullNameLabel,
                                controller: viewModel.nameController,
                              ),
                              SizedBox(
                                height: AppPadding.p10.h,
                              ),
                              Text(
                                ConstantManager.phoneNumber,
                                style: getRegularStyle(
                                    color: AppColors.whiteColor,
                                    size: FontSize.s16),
                              ),
                              SizedBox(
                                height: AppPadding.p8.h,
                              ),
                              TextFormFieldWidget(
                                hint: ConstantManager.phoneNumberLabel,
                                controller: viewModel.phoneController,
                              ),
                              SizedBox(
                                height: AppPadding.p10.h,
                              ),
                              Text(
                                ConstantManager.email,
                                style: getRegularStyle(
                                    color: AppColors.whiteColor,
                                    size: FontSize.s16),
                              ),
                              SizedBox(
                                height: AppPadding.p8.h,
                              ),
                              TextFormFieldWidget(
                                hint: ConstantManager.emailLabel,
                                controller: viewModel.emailController,
                              ),
                              SizedBox(
                                height: AppPadding.p10.h,
                              ),
                              Text(
                                ConstantManager.password,
                                style: getRegularStyle(
                                    color: AppColors.whiteColor,
                                    size: FontSize.s16),
                              ),
                              SizedBox(
                                height: AppPadding.p8.h,
                              ),
                              TextFormFieldWidget(
                                hint: ConstantManager.passwordLabel,
                                obscureText: true,
                                controller: viewModel.passwordController,
                                suffixIcon: const ImageIcon(
                                    AssetImage(IconAssets.view)),
                                show: true,
                                SuffixIconShowed: const ImageIcon(
                                    AssetImage(IconAssets.hide)),
                              ),
                              SizedBox(
                                height: AppPadding.p10.h,
                              ),
                              Text(
                                ConstantManager.confirmPassword,
                                style: getRegularStyle(
                                    color: AppColors.whiteColor,
                                    size: FontSize.s16),
                              ),
                              SizedBox(
                                height: AppPadding.p8.h,
                              ),
                              TextFormFieldWidget(
                                hint: ConstantManager.confirmPasswordLabel,
                                obscureText: true,
                                controller: viewModel.rePasswordController,
                                suffixIcon: const ImageIcon(
                                  AssetImage((IconAssets.view)),
                                ),
                                show: true,
                                SuffixIconShowed: const ImageIcon(
                                  AssetImage((IconAssets.hide)),
                                ),
                              ),
                              SizedBox(
                                height: AppPadding.p10.h,
                              ),
                              ElevatedButtonWidget(
                                  text: ConstantManager.signUp,
                                  onPressed: viewModel.signUp),
                              SizedBox(
                                height: AppPadding.p10.h,
                              ),
                            ],
                          ))
                    ],
                  ),
                )),
          ),
        ));
  }
}
