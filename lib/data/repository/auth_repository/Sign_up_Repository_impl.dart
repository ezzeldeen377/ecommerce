import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/SignupResonseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/auth_repository/sign_up/sign_up_Data_source.dart';
import 'package:ecommerce/domain/repository/auth_repository/sign_up/sign_up_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository{
  SignUpDataSource dataSource;
  SignUpRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failures, SignupResonseEntity>> signUp(String name, String email, String phone,
      String password, String rePassword) async {
    // TODO: implement signUp
    var either=await  dataSource.signUp(name, email, phone, password, rePassword);
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

}