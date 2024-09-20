import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/forget_password_response_entity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/auth_repository/sign_up/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  AuthRepository repository;
  ResetPasswordUseCase({required this.repository});

  Future<Either<Failures, ForgetPasswordResponseEntity>> invoke(
      String email, String newPassword) {
    return repository.resetPassword(email, newPassword);
  }
}
