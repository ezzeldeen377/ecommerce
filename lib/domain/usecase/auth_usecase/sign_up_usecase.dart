import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/SignupResonseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/auth_repository/sign_up/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  AuthRepository repository;
  SignUpUseCase({required this.repository});
  Future<Either<Failures, SignupResonseEntity>> invoke(String name,
      String email, String phone, String password, String rePassword) {
    return repository.signUp(name, email, phone, password, rePassword);
  }
}
