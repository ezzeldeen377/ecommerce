import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/LoginResponseEntity';
import 'package:ecommerce/domain/entities/SignupResonseEntity.dart';
import 'package:ecommerce/domain/failures.dart';

abstract class AuthRepository {
  Future<Either<Failures, SignupResonseEntity>> signUp(String name,
      String email, String phone, String password, String rePassword);
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}
