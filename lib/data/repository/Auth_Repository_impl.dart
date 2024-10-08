import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/LoginResponseEntity.dart';
import 'package:ecommerce/domain/entities/SignupResonseEntity.dart';
import 'package:ecommerce/domain/entities/forget_password_response_entity.dart';

import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/auth_repository/sign_up/auth_Data_source.dart';
import 'package:ecommerce/domain/repository/auth_repository/sign_up/auth_repository.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthDataSource dataSource;
  AuthRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failures, SignupResonseEntity>> signUp(String name,
      String email, String phone, String password, String rePassword) async {
    // TODO: implement signUp
    var either =
        await dataSource.signUp(name, email, phone, password, rePassword);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password) async {
    // TODO: implement login
    var either = await dataSource.login(email, password);
    return either.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  @override
  Future<Either<Failures, ForgetPasswordResponseEntity>> forgetPassword(
      String email) async {
    var either = await dataSource.forgetPassword(email);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, ForgetPasswordResponseEntity>> verifyCode(
      String code) async {
    var either = await dataSource.verifyCode(code);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, ForgetPasswordResponseEntity>> resetPassword(
      String email, String newPassword) async {
    var either = await dataSource.resetPassword(email, newPassword);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
