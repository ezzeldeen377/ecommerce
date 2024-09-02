import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/SignupResonseEntity.dart';
import 'package:ecommerce/domain/failures.dart';

abstract class SignUpDataSource{
  Future<Either<Failures,SignupResonseEntity>> signUp(String name,String email,String phone,String password,String rePassword);

}