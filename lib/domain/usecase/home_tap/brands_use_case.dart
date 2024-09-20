import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/BrandResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/home_tap/home_tap_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandUseCase {
  HomeTapRepository repository;
  BrandUseCase({required this.repository});

  Future<Either<Failures, BrandResponseEntity>> invoke() async {
    var either = await repository.getAllBrands();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
