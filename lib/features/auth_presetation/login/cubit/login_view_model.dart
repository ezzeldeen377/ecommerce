import 'package:ecommerce/domain/usecase/auth_usecase/login_use_case.dart';
import 'package:ecommerce/features/auth_presetation/login/cubit/login_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase useCase;
  LoginViewModel({required this.useCase}) : super(LoginInitialState());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  Future<void> login() async {
    try {
      emit(LoginLoadingState());
      var either =
          await useCase.invoke(emailController.text, passwordController.text);
      either.fold((error) {
        emit(LoginErrorState(errorMessage: error.errorMessage));
      }, (response) {
        emit(LoginSuccessState(response: response));
      });
    } catch (e) {
      emit(LoginErrorState(errorMessage: e.toString()));
    }
  }
}
