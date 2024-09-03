import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/category_response_entity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/home_tap/home_tap_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CateogoryUseCase {
  HomeTapRepository repository;
  CateogoryUseCase({required this.repository});
  Future<Either<Failures, CategoryResponseEntity>> invoke() async {
    var either = await repository.getAllCategory();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
