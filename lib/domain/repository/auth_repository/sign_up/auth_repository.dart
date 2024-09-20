import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/LoginResponseEntity.dart';
import 'package:ecommerce/domain/entities/SignupResonseEntity.dart';
import 'package:ecommerce/domain/entities/forget_password_response_entity.dart';
import 'package:ecommerce/domain/failures.dart';

abstract class AuthRepository {
  Future<Either<Failures, SignupResonseEntity>> signUp(String name,
      String email, String phone, String password, String rePassword);
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
  Future<Either<Failures, ForgetPasswordResponseEntity>> forgetPassword(
      String email);
  Future<Either<Failures, ForgetPasswordResponseEntity>> verifyCode(
      String code);
  Future<Either<Failures, ForgetPasswordResponseEntity>> resetPassword(
      String email, String newPassword);
}
