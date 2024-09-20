import 'package:ecommerce/domain/di/di.dart';
import 'package:ecommerce/domain/usecase/auth_usecase/forget_password_use_case.dart';
import 'package:ecommerce/domain/usecase/auth_usecase/reset_password_use_case.dart';
import 'package:ecommerce/domain/usecase/auth_usecase/verify_code_use_case.dart';
import 'package:ecommerce/presentation/auth_presetation/forget_password/cubit/forget_password_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  ForgetPasswordViewModel(
      {required this.forgetPasswordUseCase,
      required this.verifyCodeUseCase,
      required this.resetPasswordUseCase})
      : super(ForgetPasswordInitailState());

  ForgetPasswordUseCase forgetPasswordUseCase;
  VerifyCodeUseCase verifyCodeUseCase;
  ResetPasswordUseCase resetPasswordUseCase;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  static ForgetPasswordViewModel get(BuildContext context) =>
      BlocProvider.of<ForgetPasswordViewModel>(context);

  List<TextEditingController> verifyNumbers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  String? email;

  Future<void> forgetPassword() async {
    emit(ForgetPasswordLoadingState());
    var response =
        await forgetPasswordUseCase.invoke(emailController.text.trim());
    response.fold((error) {
      print(error.errorMessage);

      emit(ForgetPasswordErrorState(errorMessage: error.errorMessage));
    }, (response) {
      email = emailController.text;
      print(response.message);
      emit(ForgetPasswordSendedEmailState(response: response));
    });
  }

  String getStringFromList() {
    List<String> list = [];
    for (TextEditingController element in verifyNumbers) {
      list.add(element.text);
    }
    return list.join();
  }

  Future<void> verifyCode() async {
    String code = getStringFromList();
    var response = await verifyCodeUseCase.invoke(code);
    response.fold((error) {
      emit(VerifyCodeErrorState(errorMessage: error.errorMessage));
    }, (response) {
      emit(VerifyCodeSuccessState(response: response));
    });
  }

  void resetPassword() async {
    var response = await resetPasswordUseCase.invoke(
        email!, passwordController.text.trim());
    response.fold((error) {
      emit(ResetPasswrodErrorState(errorMessage: error.errorMessage));
    }, (response) {
      emit(ResetPasswordSuccessState(response: response));
    });
  }
}
