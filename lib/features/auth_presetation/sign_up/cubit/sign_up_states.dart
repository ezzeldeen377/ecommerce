import 'package:ecommerce/domain/entities/SignupResonseEntity.dart';

abstract class SignUpStates{}
class SignUpLoadingState extends SignUpStates{}
class SignUpInitialState extends SignUpStates{}

class SignUpErrorState extends SignUpStates{
  String errorMassage;
  SignUpErrorState({required this.errorMassage});
}
class SignUpSuccessState extends SignUpStates{
  SignupResonseEntity response;
  SignUpSuccessState({required this.response});
}