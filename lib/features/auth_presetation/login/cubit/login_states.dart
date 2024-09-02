import 'package:ecommerce/domain/entities/LoginResponseEntity';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String errorMessage;
  LoginErrorState({required this.errorMessage});
}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity response;
  LoginSuccessState({required this.response});
}
