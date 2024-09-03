import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/category_response_entity.dart';
import 'package:ecommerce/domain/failures.dart';

abstract class HomeTapDataSource {
  Future<Either<Failures, CategoryResponseEntity>> getAllCategory();
}
