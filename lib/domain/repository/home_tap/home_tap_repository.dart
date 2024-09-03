import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/CategoryResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';

abstract class HomeTapRepository {
  Future<Either<Failures, CategoryResponseEntity>> getAllCategory();
}
