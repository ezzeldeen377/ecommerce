import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/LoginResponseEntity';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/auth_repository/sign_up/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepository repository;
  LoginUseCase({required this.repository});

  Future<Either<Failures, LoginResponseEntity>> invoke(
      String email, String password) async {
    var either = await repository.login(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
