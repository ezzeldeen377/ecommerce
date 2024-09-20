import 'package:ecommerce/data/model/auth_models/ForgetPasswordResponseDto.dart';
import 'package:ecommerce/domain/entities/forget_password_response_entity.dart';

abstract class ForgetPasswordStates {}

class ForgetPasswordInitailState extends ForgetPasswordStates {}

class ForgetPasswordLoadingState extends ForgetPasswordStates {}

class ForgetPasswordSendedEmailState extends ForgetPasswordStates {
  ForgetPasswordResponseEntity response;
  ForgetPasswordSendedEmailState({required this.response});
}

class ForgetPasswordErrorState extends ForgetPasswordStates {
  String errorMessage;
  ForgetPasswordErrorState({required this.errorMessage});
}

class VerifyCodeSuccessState extends ForgetPasswordStates {
  ForgetPasswordResponseEntity response;
  VerifyCodeSuccessState({required this.response});
}

class VerifyCodeErrorState extends ForgetPasswordStates {
  String errorMessage;
  VerifyCodeErrorState({required this.errorMessage});
}

class ResetPasswordSuccessState extends ForgetPasswordStates {
  ForgetPasswordResponseEntity response;
  ResetPasswordSuccessState({required this.response});
}

class ResetPasswrodErrorState extends ForgetPasswordStates {
  String errorMessage;
  ResetPasswrodErrorState({required this.errorMessage});
}
