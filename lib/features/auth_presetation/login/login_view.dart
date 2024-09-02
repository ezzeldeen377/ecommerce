import 'package:ecommerce/core/resources/app_colors.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/text_style_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes_manager/routes.dart';
import 'package:ecommerce/core/widgets/elevated_button_widget.dart';
import 'package:ecommerce/core/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
              height: 932.h,
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
                              color: AppColors.whiteColor, size: FontSize.s16),
                        ),
                        const SizedBox(
                          height: AppPadding.p8,
                        ),
                        TextFormFieldWidget(
                          hint: ConstantManager.emailLabel,
                          controller: emailController,
                        ),
                        const SizedBox(
                          height: AppPadding.p10,
                        ),
                        Text(
                          ConstantManager.password,
                          style: getRegularStyle(
                              color: AppColors.whiteColor, size: FontSize.s16),
                        ),
                        const SizedBox(
                          height: AppPadding.p8,
                        ),
                        TextFormFieldWidget(
                          hint: ConstantManager.passwordLabel,
                          obscureText: true,
                          controller: passwordController,
                          icon: const ImageIcon(AssetImage((IconAssets.hide))),
                        ),
                        const SizedBox(
                          height: AppPadding.p10,
                        ),
                        Text(
                          ConstantManager.forgetPassword,
                          style: getRegularStyle(
                              color: AppColors.whiteColor, size: FontSize.s16),
                          textAlign: TextAlign.end,
                        ),
                        const SizedBox(
                          height: AppPadding.p22,
                        ),
                        ElevatedButtonWidget(
                          text: ConstantManager.login,
                          onPressed: () {},
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
                                Navigator.of(context).pushNamed(Routes.signUp);
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
        ));
  }
}
