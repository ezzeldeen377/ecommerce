import 'package:ecommerce/domain/usecase/auth_usecase/sign_up_usecase.dart';
import 'package:ecommerce/features/auth_presetation/sign_up/cubit/sign_up_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpStates> {
  SignUpViewModel({required this.useCase}) : super(SignUpInitialState());
  SignUpUseCase useCase;
  var nameController = TextEditingController(text: "weqwqeq");
  var emailController = TextEditingController(text: "ezzeldeen1@gmail.com");
  var phoneController = TextEditingController(text: '011210026265');
  var passwordController = TextEditingController(text: '123456');
  var rePasswordController = TextEditingController(text: '123456');
  var formKey = GlobalKey<FormState>();

  void signUp() async {
    emit(SignUpLoadingState());
    var either = await useCase.invoke(
        nameController.text,
        emailController.text,
        phoneController.text,
        passwordController.text,
        rePasswordController.text);
    either.fold((error) {

      emit(SignUpErrorState(errorMassage: error.errorMessage));
    }, (success) {
      emit(SignUpSuccessState(response: success));
    });
  }
}
